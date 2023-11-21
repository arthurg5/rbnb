class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @cars = current_user.cars
    @owner_first_name = current_user.first_name
    @owner_last_name = current_user.last_name
  end
end
