# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

User.destroy_all
Spaceship.destroy_all

puts 'Creating 5 fake users...'
5.times do
  User.create(
  email: "#{Faker::Name.first_name}@gmail.com",
  password: "123456"
)
end
puts 'Creating 10 fake spaceships...'

10.times do
  spaceship = Spaceship.new(
    name: Faker::Space.nasa_space_craft,
    price: Faker::Number.decimal(l_digits: 2),
    description: Faker::Quote.yoda,
    user_id: User.all.sample.id,
    speed: rand(0-100),
    power: rand(7-12),
    seats: rand(1-29)
  )
  1.times do
    rand_num = rand(2..8)
    file = URI.open("app/assets/images/spaceships/#{rand_num}-spaceship-Small.png")
    spaceship.photos.attach(io: file, filename: "#{rand_num}.png", content_type: "image/png")
  end
  4.times do
    rand_number = rand(1..10)
    file = URI.open("app/assets/images/real_spaceships/#{rand_number}-realspace.png")
    spaceship.photos.attach(io: file, filename: "#{rand_number}real.png", content_type: "image/png")
  end
  spaceship.save!
end

puts 'Creating 7 fake bookings...'

7.times do
  booking = Booking.new(
    spaceship_id: Spaceship.all.sample.id,
    user_id: User.all.sample.id,
    start_date: Faker::Date.between(from: '2023-03-01', to: '2023-12-01'),
  )
  booking.end_date = Faker::Date.between(from: booking.start_date, to: '2023-12-01')
  booking.save!
end

puts 'Finished!'


# Alternate version made by Sebi
# 4.times do
#   user = User.new(
#     email: "#{Faker::Name.first_name}@gmail.com",
#     password: "123456"
#   )
#   user.save!
#   10.times do
#     spaceship = Spaceship.new(
#       name:    Faker::Space.nasa_space_craft,
#       price: "#{Faker::Number.decimal(l_digits: 2)} $",
#       description: Faker::Quote.yoda
#     )
#     spaceship.user = user
#     spaceship.save!
#   end
# end

# 7.times do
#   booking = Booking.new(
#     spaceship_id: Spaceship.all.sample.id,
#     user_id: User.all.sample.id,
#     start_date: Faker::Date.between(from: '2023-03-01', to: '2023-12-01'),
#   )
#   # puts 'made a booking without start date'
#   booking.end_date = Faker::Date.between(from: booking.start_date, to: '2023-12-01')
#   booking.save!
# end
