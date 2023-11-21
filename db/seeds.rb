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
