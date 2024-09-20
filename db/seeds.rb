# This file should contain all the record creation needed to seed the database with its default values.
# At the beginning of your seeds.rb file
if Rails.env.production? && Restaurant.count > 0
  puts "Production database already seeded. Skipping seed data."
else
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

  addresses = ["Calle Valencia, 181, 08011 Barcelona", "Calle Valencia, 90, 08015 Barcelona", "Carrer de Santa Fe de Nou Mèxic, 17, 08017, Barcelona", "Avenida de Josep Tarradellas, 138, 08029 Barcelona", "C/ d'Entença, 155, 08029 Barcelona", "C/ de Pau Claris, 139, 08009 Barcelona", "C. del Consell de Cent, 403, 08009 Barcelona", "C/ de Bailèn, 115, 08009 Barcelona", "Carrer del Rosselló, 208, 08008 Barcelona", "Carrer de Girona, 51, 08009 Barcelona", "Carrer de Girona, 133, 08037 Barcelona", "Carrer d'Alí Bei, 65, 08013 Barcelona", "Passatge de Sant Benet, 9, 08003 Barcelona", "C/ de Sicília, 93, 08013 Barcelona", "Carrer del Rec Comtal, 17, 08003 Barcelona", "Pg. de Sant Joan, 56, 08009 Barcelona", "Carrer de Lepant, 203, 08013 Barcelona", "Passatge de Font, 5, 08013 Barcelona", "C/ d'Àvila, 87, 08005 Barcelona", "C. de Pujades, 133, 08005 Barcelona", "Avinguda Diagonal, 173, 08018 Barcelona", "Carrer de Sancho de Ávila, 178, 08018 Barcelona", "C. de Pallars, 345, 08019 Barcelona", "Passeig de Garcia Fària, 33, 08005 Barcelona", "C/ de Josep Pla, 45, 08019 Barcelona", "Carrer de Llull, 389, 08019 Barcelona", "Rbla. de Guipúscoa, 143, 08020 Barcelona", "Carrer de Josep Miret, 19, 08020 Barcelona", "Rambla de Prim, 160, 08020 Barcelona", "Carrer d'Olesa, 7, 08027 Barcelona", "C/ de Sant Antoni Maria Claret, 181, 08041 Barcelona", "Carrer del Degà Bahí, 61, 08026 Barcelona", "Passeig de Maragall, 217bis, 08032 Barcelona", "Carrer de Varsòvia, 57, 08041 Barcelona", "Carrer de Zamora, 78, 08018 Barcelona", "Carrer de la Marina, 56, 08005 Barcelona", "Carrer de l'Argenter, 2, 08003 Barcelona", "C. del Baluard, 56, 08003 Barcelona", "C/ de Balboa, 6, 08003 Barcelona", "Passeig d'Isabel II, 14, 08003 Barcelona", "Carrer d'En Botella, 11, 13, 08001 Barcelona", "Ronda de Sant Pau, 59, 08015 Barcelona", "C. de Villarroel, 1, 08011 Barcelona", "Ronda de Sant Antoni, 41, 08011 Barcelona", "C. del Parlament, 25, 08015 Barcelona", "C. del Comte Borrell, 81, 08015 Barcelona", "Gran Via de les Corts Catalanes, 522, 08011 Barcelona", "Gran Via de les Corts Catalanes, 539, 08011 Barcelona", "Gran Via de les Corts Catalanes, 539, 08011 Barcelona", "Carrer de la Mare de Déu del Remei, 53, 08004 Barcelona", "Gran Via de les Corts Catalanes, 420, Local, 08015 Barcelona", "Ctra. de Miramar, 38, 08038 Barcelona"]

  50.times do |i|
    restaurant = Restaurant.new(
      name:    Faker::Company.name,
      address: addresses.sample,
      rating:  rand(0..5),
      cuisine: cuisines.sample,
      image_url: "restaurant_#{i + 1}",
      review_quantity: Faker::Number.number(digits: 3)
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
end