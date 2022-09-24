# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts 'Clear the database'

Booking.destroy_all
Restaurant.destroy_all
Dish.destroy_all
User.destroy_all

puts 'Creating users'

user1 = User.new(
  email: 'itab.ghazouani@gmail.com',
  password: 'Password'
)
user1.save!

user2 = User.new(
  email: 'stephenmcgowan@gmail.com',
  password: 'Password'
)
user2.save!

puts 'Creating restaurants'

cuisines = ['French', 'Italian', 'Fast Food', 'Mediterranean', 'Japanese', 'Peruvian', 'Mexican']

50.times do |i|
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    rating:  rand(0..5),
    cuisine: cuisines.sample,
    image_url: "restaurant_#{i + 1}"
  )
  restaurant.save!
end

puts 'Creating dishes'

100.times do
  dish = Dish.new(
    name: Faker::Food.dish,
    details: Faker::Food.description
  )
  dish.save!
end

puts 'Creating restaurant dishes'

Restaurant.all.each do |restaurant|
  rand(10..20).times do
    restaurant_dish = RestaurantDish.new(
      restaurant: restaurant,
      dish: Dish.all.sample,
      price_for_dish: rand(6.0..25.9).round(2)
    )
    restaurant_dish.save!
  end
end

puts 'Creating bookings'

User.all.each do |user|
  rand(2..5).times do
    booking = Booking.new(
      restaurant: Restaurant.all.sample,
      user: user,
      phone_number: Faker::PhoneNumber,
      name: Faker::Name,
      guest_count: rand(1..6),
      booking_date: Faker::Time.forward(days: 5,  period: :evening, format: :long)
    )
    booking.save!
  end
end

puts 'Finished!'
