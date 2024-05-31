puts 'creation of users'

Costume.destroy_all
User.destroy_all


user1 = User.new(
  email: "bru1@gmail.com",
  password: "Brun@1234",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address
)
avatar1 = File.open("app/assets/images/photo-1.jpg")
user1.photo.attach(io: avatar1, filename: "photo-1.jpg", content_type: "image/jpeg")
user1.save


user2 = User.new(
  email: "jjjoachim1@hotmail.be",
  password: "Brun@123",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address
)
avatar2 = File.open("app/assets/images/photo-2.jpg")
user2.photo.attach(io: avatar2, filename: "photo-2.jpg", content_type: "image/jpeg")
user2.save


user3 = User.new(
  email: "j00oachim2@hotmail.be",
  password: "Brun@1231",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address
)
avatar3 = File.open("app/assets/images/photo-3.jpg")
user3.photo.attach(io: avatar3, filename: "photo-3.jpg", content_type: "image/jpeg")
user3.save


user4 = User.new(
  email: "joaaachim3@hotmail.be",
  password: "Brun@1236",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,

  address: Faker::Address.full_address
)
avatar4 = File.open("app/assets/images/photo-4.jpg")
user4.photo.attach(io: avatar4, filename: "photo-4.jpg", content_type: "image/jpeg")
user4.save


user5 = User.new(
  email: "joacccchim5@hotmail.be",
  password: "Brun@1239",
  first_name: Faker::FunnyName.name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address
)
avatar5 = File.open("app/assets/images/photo-5.jpg")
user5.photo.attach(io: avatar5, filename: "photo-5.jpg", content_type: "image/jpeg")
user5.save








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

user1 = User.first

costume_nice = user1.costumes.new(
  title: "Harley Quinn",
  description: "Step into the world of Gotham with a Harley Quinn costume..",
  details: "Transform your next event into an unforgettable experience with our Harley Quinn costume rental. Whether you’re attending a costume party, a cosplay convention, or a themed event, this rental package promises a hassle-free, immersive adventure. Wearing our Harley Quinn costume, you’ll turn heads and capture the essence of Gotham’s beloved anti-heroine. Expect lots of photo opportunities, compliments, and an overall boost to your event experience.",
  price_per_day: "53.5",
  size: "Medium",
  category: "SuperHero"
)

harley_array_urls = ["https://i.ebayimg.com/images/g/N24AAOSwIgNXtJgz/s-l1600.jpg","https://media1.ledevoir.com/images_galerie/nwd_786888_620902/image.jpg","https://i.pinimg.com/originals/03/30/b7/0330b7c45d2f4e2d7600b995cd99737d.jpg","https://i.pinimg.com/236x/70/65/97/7065976a006a2ffd3cb243bdfb09dc48.jpg"]
harley_array_urls.each do |url|
  file = URI.open(url)
  costume_nice.photos.attach(io: file, filename: File.basename(URI.parse(url).path), content_type: "image/jpeg")
end

costume_nice.save

puts "nice costume saved"

puts "filling costume"

user2 = User.last
costume_1 = user2.costumes.new(
  title: "Joker",
  description: "Embody the most feared criminal of Gotham..",
  details: "Embrace the chaos with a Joker costume rental, featuring a high-quality purple suit, green vest, and iconic accessories. Perfect for parties and cosplay events, this complete package ensures you stand out as Gotham’s most notorious villain.",
  size: "Large",
  category: "SuperHero",
  price_per_day: "75.3"
)
file_1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Anthony_Misiano_as_the_Joker_%287574256222%29.jpg/640px-Anthony_Misiano_as_the_Joker_%287574256222%29.jpg")
costume_1.photos.attach(io: file_1, filename:"costume photo", content_type: "image/jpeg")
costume_1.save


user3 =  User.find_by(email: "joacccchim5@hotmail.be")
costume_2 = user3.costumes.new(
  title: "Naruto Uzumaki",
  description: "Transform into the greatest warrior ever..",
  details: "Unleash your inner ninja with our Naruto costume rental. Featuring an authentic orange and black jumpsuit, headband, and accessories, this complete package is perfect for anime conventions, cosplay events, and themed parties.",
  size: "Large",
  category: "Anime",
  price_per_day: "60.2"
)
file_2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/95/Cosplay_-_AWA15_-_Naruto_Uzumaki_derivate.png")
costume_2.photos.attach(io: file_2, filename:"costume photo", content_type: "image/jpeg")
costume_2.save

user4 =  User.find_by(email: "joacccchim5@hotmail.be")

costume_3 = user4.costumes.new(
  title: "Princess Leia ",
  description: "Transform into the galaxy’s most courageous rebel",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Large",
  category: "Movie",
  price_per_day: "69.9"
)
file_3 = URI.open("https://upload.wikimedia.org/wikipedia/en/f/fa/Princess_Leia_bikini-Return_of_the_Jedi_%281983%29.jpg")
costume_3.photos.attach(io: file_3, filename:"costume photo", content_type: "image/jpeg")
costume_3.save

costume_4 = user4.costumes.new(
  title: "Roronoa Zoro ",
  description: "Become the greatest Swordman",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Extra Large",
  category: "Anime",
  price_per_day: "77.3"
)

file_4 = URI.open("https://static.wikia.nocookie.net/onepiece/images/2/22/Roronoa_Zoro_Anime_Post_Ellipse_Infobox.png/revision/latest?cb=20140926142818&path-prefix=fr")
costume_4.photos.attach(io: file_4, filename:"costume photo", content_type: "image/jpeg")
costume_4.save

costume_5 = user1.costumes.new(
  title: "Cristiano Ronaldo ",
  description: "The GOAT",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Small",
  category: "Athlete",
  price_per_day: "100.3"
)
file_5 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/800px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg")
costume_5.photos.attach(io: file_5, filename:"costume photo", content_type: "image/jpeg")
costume_5.save

user5 =  User.find_by(email: "joacccchim5@hotmail.be")

costume_6 = user5.costumes.new(
  title: "Link",
  description: "Small in height but big in heart..",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Extra Small",
  category: "Nintendo",
  price_per_day: "47.32"
)
file_6 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg_IM0UMR8pn_e5y7tnu0j_hgdLdBir67fYA&s")
costume_6.photos.attach(io: file_6, filename:"costume photo", content_type: "image/jpeg")
costume_6.save


costume_7 = user3.costumes.new(
  title: "Barack Obama",
  description: "USA USA USA",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Extra Large",
  category: "Leader",
  price_per_day: "9.11"
)
file_7 = URI.open("https://www.thoughtco.com/thmb/o2xaDCaMW93CkSN0kVm53Rj5-Iw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/BarackObama-799035cd446c443fb392110c01768ed0.jpg")
costume_7.photos.attach(io: file_7, filename:"costume photo", content_type: "image/jpeg")
costume_7.save

costume_8 = user2.costumes.new(
  title: "Brazilian Carnaval",
  description: "Jogadinho do Brazil, Samba",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Extra Large",
  category: "Leader",
  price_per_day: "55.55"
)
file_8 = URI.open("https://m.media-amazon.com/images/I/41MB1BAPtCL._AC_SY780_.jpg")
costume_8.photos.attach(io: file_8, filename:"costume photo", content_type: "image/jpeg")
costume_8.save


costume_9 = user2.costumes.new(
  title: "Michael jackson",
  description: "The KING of PoP.",
  details: "Step into the galaxy with our Princess Leia costume rental. Featuring her iconic white dress, belt, and signature bun wig, this complete package is perfect for Star Wars events, cosplay, and themed parties.",
  size: "Medium",
  category: "Leader",
  price_per_day: "69"
)
file_9 = URI.open("https://i.pinimg.com/564x/f7/7d/00/f77d00361a3093ec2e203fd8360f9b32.jpg")
costume_9.photos.attach(io: file_9, filename:"costume photo", content_type: "image/jpeg")
costume_9.save



puts 'done with other costumes'
