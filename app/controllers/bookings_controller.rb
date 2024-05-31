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
      redirect_to bookings_path(booking_id: @booking.id)
    else
      flash.now[:alert] = 'Your booking was not successful. Make sure the end date is after the start date!'
      render 'costumes/show', status: :unprocessable_entity
    end
  end

  def index
    @bookings = current_user.bookings.order(start_date: :asc)
    @booking = @bookings.detect { |booking| booking.id == params[:booking_id].to_i }
  end

  private

  def booking_params
    attributes = {
    }
    permitted_params = params.require(:booking).permit(:start_date)
    attributes[:start_date] = permitted_params[:start_date].gsub(/ to .*/, '').to_date
    attributes[:end_date] = permitted_params[:start_date].gsub(/.* to /, "").to_date

    return attributes
  end

  def amount_of_days
    start_date = @booking.start_date.to_date
    end_date = @booking.end_date.to_date

    diff_date = (end_date - start_date).to_i
    diff_date.zero? ? 1 : diff_date
  end
end
