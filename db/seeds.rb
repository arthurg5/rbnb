require 'faker'

# puts 'Creating 10 fake users'
# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )

#   puts "Creating cars for user #{user.id}"
#   3.times do
#     car = user.cars.create!(
#       model: Faker::Vehicle.model,
#       year: Faker::Vehicle.year,
#       fuel: "Gasoline",
#       color: Faker::Vehicle.color,
#       price: Faker::Commerce.price(range: 80..300),
#       description: Faker::Lorem.sentence
#     )
#     puts "Car #{car.id} created for user #{user.id}"
#   end
# end
# puts 'Seed creation is over!'

puts 'Creating 5 fake users'


5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  puts "Creating cars for user #{user.id}"

  user.cars.create!(
    model: "Audi A3",
    year: 2011,
    color: "grey",
    fuel: "Diesel",
    price: 125.5,
    description: "fast and comfortable",
    address: "Paris 11"
  )

  user.cars.create!(
    model: "Citroen electric",
    year: 2020,
    color: "orange",
    fuel: "Electric",
    price: 112.5,
    description: "easy to drive and great for the environment",
    address: "Vincennes"
  )

  user.cars.create!(
    model: "Mitsubishi x force",
    year: 2022,
    color: "grey",
    fuel: "Biofuels",
    price: 107.5,
    description: "ideal for long distances",
    address: "Paris 10"
  )

  user.cars.create!(
    model: "Peugeot 3008",
    year: 2020,
    color: "grey",
    fuel: "Ethanol Hybrid",
    price: 131.5,
    description: "ideal for family",
    address: "Paris 9"
  )

  user.cars.create!(
    model: "Renault Megane",
    year: 2018,
    color: "red",
    fuel: "Gasoline",
    price: 95.5,
    description: "very secure and comfortable",
    address: "Montreuil"
  )

  user.cars.create!(
    model: "Tesla",
    year: 2022,
    color: "white",
    fuel: "Electric",
    price: 155.5,
    description: "high-class standard's car with safety features",
    address: "Paris 12"
  )
end



puts 'Seed creation is over!'
