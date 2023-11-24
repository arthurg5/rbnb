class CarsController < ApplicationController
  def index
    @cars = Car.all

    if params[:query]
      @cars = Car.search_cars(params[:query])
    end

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { car: car }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end


  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to dashboard_path
  end

  private

  def car_params
    params.require("car").permit(:model, :year, :color, :fuel, :price, :description, :address, :longitude, :latitude, photos: [])
  end
end
