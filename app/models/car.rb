class Car < ApplicationRecord
  has_many_attached :photos
  # authentification
  # skip_before_action :authenticate_user!, only: :home

  include PgSearch::Model
  pg_search_scope :search_cars,
  against: [ :model, :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # fuel choices
  FUEL = %w(Diesel Gasoline Biofuels LPG Electric Ethanol Hybrid)
  belongs_to :user
  has_many :bookings
  # validations
  validates :model, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :fuel, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :fuel, inclusion: { in: FUEL, message: "%{value} is not a valid fuel type" }
end
