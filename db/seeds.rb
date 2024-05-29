# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'starting to generate'

Booking.destroy_all
Costume.destroy_all
User.destroy_all

5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  3.times do
    costume = user.costumes.create(
      title: Faker::Fantasy::Tolkien.character,
      description: Faker::Fantasy::Tolkien.poem,
      price_per_day: Faker::Commerce.price(range: 10.0..100.0)
    )

    booking = Booking.new(
      start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
      end_date: Faker::Date.between(from: Date.today, to: 5.days.from_now),
      user: user,
      costume: costume
    )

    days_diff = (booking.end_date.to_date - booking.start_date.to_date).to_i
    total_days = days_diff.zero? ? 1 : days_diff
    booking[:total_price] = total_days * booking.costume.price_per_day

    booking.save
  end
end

bruna = User.create(
  email: "bru@gmail.com",
  password: "Brun@123"
)

3.times do
    bruna.costumes.create(
    title: Faker::Fantasy::Tolkien.character,
    description: Faker::Fantasy::Tolkien.poem,
    price_per_day: Faker::Commerce.price(range: 10.0..100.0)
  )
end

puts "Done :)"
