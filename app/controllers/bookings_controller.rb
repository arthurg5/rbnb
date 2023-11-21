class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params1)
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
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
    redirect_to bookings_path
  end

  private

  def booking_params1
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_params2
    params.require(:booking).permit(:status)
  end
end
