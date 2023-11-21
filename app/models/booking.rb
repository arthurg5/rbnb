require 'date_validator'

class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  STATUS = %w(Accepted Rejected Pending Cancelled Finalized)

  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, date: true # using date_validator gem
  validates :status, inclusion: { in: STATUS, message: "%{value} is not a valid status type" }
end
