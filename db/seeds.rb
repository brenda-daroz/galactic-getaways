# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Spaceship.destroy_all
# User.destroy_all

5.times do
  User.create(
  email: "#{Faker::Name.first_name}@gmail.com",
  password: "123455"
)
end
puts 'Creating 10 fake spaceships...'

10.times do
  spaceship = Spaceship.new(
    name:    Faker::Space.nasa_space_craft,
    price: "#{Faker::Number.decimal(l_digits: 2)} $",
    description: Faker::Quote.yoda,
    user_id: User.all.sample.id
  )
  spaceship.save!
end
puts 'Finished!'
