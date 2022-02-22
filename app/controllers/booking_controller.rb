class BookingsController < ApplicationController
  def new
    @forest = Forest.find(params[:forest_id])
    @booking = Booking.new
  end

  def create
    if Booking.available?
    @booking = Booking.new(booking_params)
    @forest = Forest.find(params[:forest_id])
    @booking.forest = @forest
    if @booking.save
      redirect_to forest_path(@forest)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to forest_path(@forest)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to forest_path(@forest)
  end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
