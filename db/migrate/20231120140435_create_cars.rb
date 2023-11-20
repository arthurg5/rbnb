class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year
      t.string :color
      t.string :fuel
      t.float :price
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
