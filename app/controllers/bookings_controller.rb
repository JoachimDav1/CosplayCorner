require 'date'

class BookingsController < ApplicationController

  def create
    @costume = Costume.find(params[:costume_id])
    @user = current_user

    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = @user
    @booking.total_price = @booking.costume.price_per_day * amount_of_days

    if @booking.save!
      redirect_to booking_path(@booking), notice: 'Booking was successfully registered. Have fun!'
    else
      render 'costumes/show', status: :unprocessable_entity
    end
  end

  # how to update the availability?

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

  def amount_of_days
    start_date = @booking[:start_date].to_date
    end_date = @booking[:end_date].to_date
    diff_date = (end_date - start_date).to_i
    diff_date.zero? ? 1 : diff_date
  end
end
