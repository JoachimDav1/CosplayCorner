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
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::FunnyName.name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address
  )
  avatar_url = "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"
  file_avatar = URI.open(avatar_url)
  user.photo.attach(io: file_avatar, filename: "css/ss",content_type: "image/jpeg")
  user.save

  puts 'one created'

  3.times do
    costume = user.costumes.new(
      title: Faker::Fantasy::Tolkien.character,
      description: Faker::Fantasy::Tolkien.poem,
      price_per_day: Faker::Commerce.price(range: 10.0..100.0)
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
      "https://cdn.pixabay.com/photo/2015/07/26/21/23/hulk-861754_1280.jpg",
      "https://cdn.pixabay.com/photo/2019/09/28/23/55/girl-4512047_1280.jpg",
      "https://cdn.pixabay.com/photo/2021/01/16/18/20/woman-5923040_1280.jpg",
      "https://cdn.pixabay.com/photo/2015/09/14/20/52/cowboy-940083_1280.jpg"
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
avatar_bruna = "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"
file_avatar = URI.open(avatar_bruna)
bruna.photo.attach(io: file_avatar, filename: "css/ss",content_type: "image/jpeg")
bruna.save

3.times do
    bruna.costumes.create(
    title: Faker::Fantasy::Tolkien.character,
    description: Faker::Fantasy::Tolkien.poem,
    price_per_day: Faker::Commerce.price(range: 10.0..100.0)
  )
end

puts "Done :)"
