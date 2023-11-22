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

puts 'Creating new user'

# user1 = User.create!(
#   email: "helene@gmail.com",
#   password: "123456",
#   first_name: "Hélène",
#   last_name: "Allies"
# )

# car1 = user1.cars.create!(
#   model: "Jaguar",
#   year: "2019",
#   fuel: "Diesel",
#   color: "Red",
#   price: 300,
#   description: "Very fast but not ecolo"
# )

# puts "Car #{car1.id} created for user #{user1.id}"

# user2 = User.create!(
#   email: "albertine@gmail.com",
#   password: "123456",
#   first_name: "Albertine",
#   last_name: "Champois"
# )

# user3 = User.create!(
#   email: "george@gmail.com",
#   password: "123456",
#   first_name: "George",
#   last_name: "Sand"
# )

# user4 = User.where(first_name: "Billy")


puts "Cleaning database.........."
User.destroy_all
Car.destroy_all

user4 = User.create!(
  email: "billy@gmail.com",
  password: "123456",
  first_name: "Billy",
  last_name: "Boop"
)

3.times do
  car4 = user4.cars.create!(
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  fuel: "Gasoline",
  color: Faker::Vehicle.color,
  price: Faker::Commerce.price(range: 80..300),
  description: Faker::Lorem.sentence,
  address: Faker::Address.full_address
  )
  puts "Car #{car4.id} created for user #{user4.id}"
end

# 3.times do
#   car3 = user3.cars.create!(
#   model: Faker::Vehicle.model,
#   year: Faker::Vehicle.year,
#   fuel: "Biofuels",
#   color: Faker::Vehicle.color,
#   price: Faker::Commerce.price(range: 80..300),
#   description: Faker::Lorem.sentence
#   )
#   puts "Car #{car3.id} created for user #{user3.id}"
# end


puts 'Seed creation is over!'
