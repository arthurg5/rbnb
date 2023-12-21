require 'faker'

Booking.destroy_all
Car.destroy_all
User.destroy_all

puts 'Creating 15 fake users'

car_models = [
  {
    model: "Audi",
    year: 2011,
    color: "grey",
    fuel: "Diesel",
    price: 125.5,
    description: "fast and comfortable",
    address: "11 rue Théodore de Banville, 75017 Paris",
    photos: ["https://res.cloudinary.com/djwmjh3zt/image/upload/v1700665957/development/p4cb0iyag9tta783hs9gljgeg2r7.jpg", "https://res.cloudinary.com/djwmjh3zt/image/upload/v1700664632/development/xeqod0qjiiecq5ix03c7569yic6y.jpg", "https://res.cloudinary.com/djwmjh3zt/image/upload/v1700834999/development/28ritgj73xbe2v343ex0ir42871k.jpg"]
  },
  {
    model: "Citroen",
    year: 2020,
    color: "orange",
    fuel: "Electric",
    price: 112.5,
    description: "easy to drive and great for the environment",
    address: "102 avenue du général Leclerc, 75014 Paris"
  },
  {
    model: "Bugatti",
    year: 2022,
    color: "grey",
    fuel: "Biofuels",
    price: 107.5,
    description: "ideal for long distances",
    address: "14 avenue Crespin du Gast, 75011 Paris"
  },
  {
    model: "Peugeot",
    year: 2020,
    color: "grey",
    fuel: "Biofuels",
    price: 131.5,
    description: "ideal for family",
    address: "39 rue Jacques Kable, 94130 Nogent-sur-Marne"
  },
  {
    model: "Renault",
    year: 2018,
    color: "red",
    fuel: "Gasoline",
    price: 95.5,
    description: "very secure and comfortable",
    address: "1 rue Maitre Jacques, 92100 Boulogne Billancourt"
  },
  {
    model: "Kia",
    year: 2019,
    color: "blue",
    fuel: "Diesel",
    price: 87.3,
    description: "spacious and economical",
    address: "12 avenue du Général Leclerc, 75014 Paris"

  },
  {
    model: "Jaguar",
    year: 2017,
    color: "white",
    fuel: "Hybrid",
    price: 102.4,
    description: "stylish and eco-friendly",
    address: "8 rue de la République, 69001 Lyon"

  },
  {
    model: "Fiat",
    year: 2018,
    color: "black",
    fuel: "Electric",
    price: 110.6,
    description: "modern and efficient",
    address: "4 boulevard de Strasbourg, 31000 Toulouse"

  },
  {
    model: "Volkswagen",
    year: 2020,
    color: "silver",
    fuel: "Gasoline",
    price: 105.9,
    description: "reliable and powerful",
    address: "6 place de la Comédie, 34000 Montpellier"

  },
  {
    model: "Toyota",
    year: 2019,
    color: "green",
    fuel: "LPG",
    price: 99.7,
    description: "durable and versatile",
    address: "10 rue Sainte-Catherine, 33000 Bordeaux"

  },
  {
    model: "Honda",
    year: 2017,
    color: "yellow",
    fuel: "Electric",
    price: 94.2,
    description: "fun and agile",
    address: "2 rue du Faubourg Saint-Honoré, 75008 Paris"

  },
  {
    model: "Ford",
    year: 2020,
    color: "brown",
    fuel: "Diesel",
    price: 90.8,
    description: "robust and practical",
    address: "14 rue de la Paix, 44000 Nantes"

  },
  {
    model: "Nissan",
    year: 2018,
    color: "purple",
    fuel: "Gasoline",
    price: 92.1,
    description: "smooth and comfortable",
    address: "16 cours Gambetta, 13001 Marseille"

  },
  {
    model: "BMW",
    year: 2020,
    color: "orange",
    fuel: "Hybrid",
    price: 115.3,
    description: "luxurious and elegant",
    address: "18 avenue de la Grande Armée, 75017 Paris"

  },
  {
    model: "Seat",
    year: 2019,
    color: "pink",
    fuel: "Ethanol",
    price: 112.5,
    description: "innovative and sophisticated",
    address: "20 rue du Grand Théâtre, 59000 Lille"

  },

]

users = []

# Create 15 users
15.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  users << user
end

car_models.each_with_index do |car_data, index|
  user = users[index % users.length] # Ensure users loop back if more cars than users
  car = user.cars.create!(
    model: car_data[:model],
    year: car_data[:year],
    color: car_data[:color],
    fuel: car_data[:fuel],
    price: car_data[:price],
    description: car_data[:description],
    address: car_data[:address]
  )

  # Check if photos exist and attach them to the car
  
end

puts 'Seed creation is over!'
