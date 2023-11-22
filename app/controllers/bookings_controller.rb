class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params1)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      calculate_total_price(@booking)
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params2)
    redirect_to dashboard_path
  end

  private

  def booking_params1
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_params2
    params.require(:booking).permit(:status)
  end

  def calculate_total_price(booking)
    days_booked = (booking.end_date - booking.start_date).to_i
    booking.total_price = days_booked * booking.car.price
    booking.save
  end
end
