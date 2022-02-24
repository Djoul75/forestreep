class BookingsController < ApplicationController
  before_action :forest_find, only: %i[new create destroy]

  def index
    @booking = policy_scope(Booking)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.forest = @forest
    @booking.user = current_user
    if @booking.save
      redirect_to forest_path(@forest)
    else
      render "/forests/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to forest_path(@forest)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def forest_find
    @forest = Forest.find(params[:forest_id])
  end
end
