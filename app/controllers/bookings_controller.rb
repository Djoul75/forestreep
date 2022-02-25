require 'date'

class BookingsController < ApplicationController
  before_action :forest_find, only: %i[new create destroy]

  def index
    @booking = policy_scope(Booking)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    availability = available?
    if availability == 'Please provide booking dates'
      render "/forests/show"
    elsif availability
      flash.alert = 'Forest is already booked on this period'
      redirect_to forest_path(@forest)
    elsif !availability
      @booking.forest = @forest
      @booking.user = current_user
      if @booking.save
        flash[:success] = 'Your booking has been saved'
        redirect_to '/forests/index_owner'
      else
        render "/forests/show"
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to '/forests/index_owner'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def forest_find
    @forest = Forest.find(params[:forest_id])
  end

  def available?
    dates = params[:booking][:start_date].gsub('to', '').split
    if dates.blank?
      flash.alert = 'Please provide booking dates'
    else
      start_date = Date.parse(dates[0])
      end_date = Date.parse(dates[1])
      available = []
      @forest.bookings.each do |booking|
        available << start_date.between?(booking.start_date, booking.end_date)
        available << end_date.between?(booking.start_date, booking.end_date)
        available << booking.start_date.between?(start_date, end_date)
        available << booking.end_date.between?(start_date, end_date)
      end
      available.include?(true)
    end
  end
end
