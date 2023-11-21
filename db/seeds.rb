# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# gem install faker
# db/seeds.rb
require 'faker'

puts 'Creating 30 fake cars'
30.times do
  car = Car.new(
    model:    # Faker::Company.name,
    year: # Faker::Address.street_address,
    fuel: # Faker::Address.city,
    color: # Faker::,
    price: # Faker::,
    description: # Faker::
  )
  car.save!
end
puts 'Seed creation is over!'
