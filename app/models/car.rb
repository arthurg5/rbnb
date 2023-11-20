class Car < ApplicationRecord
  # authentification
  skip_before_action :authenticate_user!, only: :home
  # fuel choices
  FUEL = %w(Diesel Gasoline Biofuels LPG Electric Ethanol Hybrid)
  belongs_to :user
  has_many :bookings
  # validations
  validates :model, :year, :color, :fuel, :price, :description, presence: true
  validates :fuel, inclusion: { in: FUEL, message: "%{value} is not a valid fuel type" }
end
