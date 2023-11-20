require 'date_validator'

class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, :end_date, :status, presence: true
  validates :start_date, :end_date, date: true # using date_validator gem
end
