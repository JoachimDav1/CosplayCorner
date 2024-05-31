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

sizes = ['Small', 'Medium', 'Large', 'Extra Large']
categories = [
  "Animal", "Superhero", "Fantasy","Historical",
  "Sci-Fi", "Pirate", "Disney", "Fairy Tale", "Zombie",
  "Cartoon", "Clown", "Sports", "Medieval",
  "Roman Mythology", "Ninja", "Samurai", "Military", "Western",
  "Space", "Sea Creature", "Robot", "Wizard", "Witch"
]


7.times do

  puts 'one created'

  1.times do
    costume = user.costumes.new(
      title: Faker::Fantasy::Tolkien.character,
      description: Faker::Fantasy::Tolkien.poem,
      price_per_day: Faker::Commerce.price(range: 10.0..100.0),
      size: sizes.sample,
      category: categories.sample
    )
    photo_urls = [
      "https://cdn.pixabay.com/photo/2023/03/10/08/08/swordsman-7841711_1280.jpg",
      "https://cdn.pixabay.com/photo/2021/04/22/02/38/superhero-6197871_1280.png",
      "https://cdn.pixabay.com/photo/2020/11/05/02/37/fairy-5714029_1280.jpg",
      "https://cdn.pixabay.com/photo/2021/04/23/05/07/girl-6200696_1280.jpg",
      "https://cdn.pixabay.com/photo/2022/04/26/08/44/cosplay-7157777_1280.jpg",
      "https://cdn.pixabay.com/photo/2018/02/18/09/44/young-3161821_1280.jpg",
      "https://cdn.pixabay.com/photo/2021/02/16/10/58/woman-6020708_1280.jpg",
      "https://cdn.pixabay.com/photo/2021/07/28/00/41/cosplay-6498021_1280.jpg",
      "https://cdn.pixabay.com/photo/2022/06/11/12/39/torii-7256285_1280.jpg",
      "https://cdn.pixabay.com/photo/2017/09/15/18/09/ninja-2753004_1280.jpg",
      "https://cdn.pixabay.com/photo/2020/07/04/13/01/fighter-5369481_1280.jpg",
      "https://cdn.pixabay.com/photo/2016/01/13/22/54/man-1139066_1280.jpg",
      "https://cdn.pixabay.com/photo/2015/07/26/21/23/hulk-861754_1280.jpg"
    ]

    sampled_photo_urls = photo_urls.sample(3)
    sampled_photo_urls.each do |url|
      file = URI.open(url)
      costume.photos.attach(io: file, filename: File.basename(URI.parse(url).path), content_type: "image/jpeg")
    end

    costume.save!

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

bruna = User.new(
  email: "bru@gmail.com",
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)

file_avatar = File.open("app/assets/images/photo-1.jpg")
bruna.photo.attach(io: file_avatar, filename: "css/ss",content_type: "image/jpeg")
bruna.save!

3.times do
    bruna.costumes.create(
    title: Faker::Fantasy::Tolkien.character,
    description: Faker::Fantasy::Tolkien.poem,
    price_per_day: Faker::Commerce.price(range: 10.0..100.0)
  )
end

puts "Done :)"



puts 'creation of users'
user1 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar1 = File.open("app/assets/images/photo-1.jpg")
user1.photo.attach(io: avatar1, filename: "photo-1.jpg", content_type: "image/jpeg")
user1.save


user2 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar2 = File.open("app/assets/images/photo-2.jpg")
user2.photo.attach(io: avatar2, filename: "photo-2.jpg", content_type: "image/jpeg")
user2.save


user3 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar3 = File.open("app/assets/images/photo-3.jpg")
user3.photo.attach(io: avatar3, filename: "photo-3.jpg", content_type: "image/jpeg")
user3.save


user4 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar4 = File.open("app/assets/images/photo-4.jpg")
user4.photo.attach(io: avatar4, filename: "photo-4.jpg", content_type: "image/jpeg")
user4.save


user5 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar5 = File.open("app/assets/images/photo-5.jpg")
user5.photo.attach(io: avatar5, filename: "photo-5.jpg", content_type: "image/jpeg")
user5.save


user6 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar6 = File.open("app/assets/images/photo-6.jpg")
user6.photo.attach(io: avatar6, filename: "photo-6.jpg", content_type: "image/jpeg")
user6.save


user7 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar7 = File.open("app/assets/images/photo-7.jpg")
user7.photo.attach(io: avatar7, filename: "photo-7.jpg", content_type: "image/jpeg")
user7.save


user8 = User.new(
  email: Faker::Internet.email,
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)
avatar8 = File.open("app/assets/images/photo-8.jpg")
user8.photo.attach(io: avatar8, filename: "photo-8.jpg", content_type: "image/jpeg")
user8.save


bruna = User.new(
  email: "bru@gmail.com",
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  address: Faker::Address.full_address
)

file_avatar = File.open("app/assets/images/photo-1.jpg")
bruna.photo.attach(io: file_avatar, filename: "css/ss",content_type: "image/jpeg")
bruna.save!

puts 'creation of users finished'

puts "creation of costumes"


puts "nice costume for presentation"

costume_nice = Costume.new(
)
