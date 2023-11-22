class AddAddressToCars < ActiveRecord::Migration[7.1]
  def change
    unless column_exists? :cars, :address
      add_column :cars, :address, :string
    end
  end
end
