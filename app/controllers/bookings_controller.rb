class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.build
  end


  def create
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.build(booking_params1)
    @booking.car = @car
    if @booking.save
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
