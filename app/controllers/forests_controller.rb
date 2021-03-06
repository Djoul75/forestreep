require 'date'

class ForestsController < ApplicationController
  before_action :forest_find, only: %i[show edit update destroy]

  def index
    @forests = policy_scope(Forest)

    if params[:query].present?
      @forests = Forest.global_search(params[:query])
    else
      @forests = Forest.all
    end

    @markers = @forests.geocoded.map do |forest|
       {
         lat: forest.latitude,
         lng: forest.longitude,
         info_window: render_to_string(partial: "info_window", locals: { forest: forest }),
         image_url: helpers.asset_url("logo.png")
       }
    end

  end

  def index_owner
    @forests = Forest.where(user: current_user)
    authorize @forests
    @today = Date.today
  end

  def show
    authorize @forest
    @booking = Booking.new
  end

  def new
    @forest = Forest.new
    authorize @forest
  end

  def create
    @forest = Forest.new(forest_params)
    authorize @forest
    @forest.user = current_user
    if @forest.save
      redirect_to '/forests/index_owner'
    else
      render :new
    end
  end

  def edit
    authorize @forest
  end

  def update
    authorize @forest
    if @forest.update(forest_params)
      redirect_to forest_path(@forest)
    else
      render :edit
    end
  end

  def destroy
    authorize @forest
    if @forest.destroy
      redirect_to '/forests/index_owner'
    else
      redirect_to forest_path(@forest)
    end
  end

  private

  def forest_params
    params.require(:forest).permit(:title, :description, :address, :tree, :animals, :price, :size, photos: [])
  end

  def forest_find
    @forest = Forest.find(params[:id])
  end
end
