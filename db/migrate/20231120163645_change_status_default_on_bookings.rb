class ChangeStatusDefaultOnBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, "Pending"
  end
end
