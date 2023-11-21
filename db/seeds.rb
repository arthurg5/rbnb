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

puts 'Creating 10 fake users'
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  puts "Creating cars for user #{user.id}"
  3.times do
    car = user.cars.create!(
      model: Faker::Vehicle.model,
      year: Faker::Vehicle.year,
      fuel: "Gasoline",
      color: Faker::Vehicle.color,
      price: Faker::Commerce.price(range: 80..300),
      description: Faker::Lorem.sentence
    )
    puts "Car #{car.id} created for user #{user.id}"
  end
end
puts 'Seed creation is over!'
