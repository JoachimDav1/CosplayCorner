require 'date'

class BookingsController < ApplicationController
  def create
    @costume = Costume.find(params[:costume_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.total_price = @booking.costume.price_per_day * amount_of_days
    @booking.costume = @booking
    if @booking.save!
      redirect_to booking_path(@booking), notice: 'Booking was successfully registered. Have fun!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # how to update the availability?

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

  def amount_of_days
    start_date = Date.parse(booking_params[:start_date])
    end_date = Date.parse(booking_params[:end_date])
    (end_date - start_date).to_i
  end
end
