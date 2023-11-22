class RenameAddressToLastNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :address, :last_name
  end
end
