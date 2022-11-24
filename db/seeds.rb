require "open-uri"
# Supprimer les model - Clean DB
Booking.destroy_all
Spa.destroy_all

User.destroy_all

# -----------------------------------------Création user
User.create!(first_name: "Louise", last_name: "Dupont", email: "louise.dupont@gmail.com", password: "123456")
User.create!(first_name: "Marc", last_name: "Leblanc", email: "marc.leblanc@gmail.com", password: "123456")

user1 = User.create!(first_name: "Ines", last_name: "Kalis", email: "ines.kalis@gmail.com", password: "123456")
user2 = User.create!(first_name: "Pierre", last_name: "Dupuis", email: "pierre.dupuis@gmail.com", password: "123456")
# ------------------------------------------Création SPA---------------------

spa = Spa.create!(name: "Ambispa", address: "60 rue de Paris 75000 Paris", price_per_hour: "80", category: "jacuzzi", rating: 4, user: User.first)
file = URI.open("https://ambispa.fr/wp-content/uploads/2018/10/Ambi-spa-privatif-Lille-detente-02.jpg")
spa.photo.attach(io: file, filename: "Ambi-spa-privatif-Lille-detente-02.jpg", content_type: "image/jpg")
spa.save

spa = Spa.create!(name: "Perle de douceur", address: "80 avenue de la liberté 59000 Lille", price_per_hour: "70", category: "hammam", rating: 4.2, user: User.first)
file = URI.open("https://chercheursdebeaute.cinqmondes.com/files/2020/09/hammam.jpg")
spa.photo.attach(io: file, filename: "hammam.png", content_type: "image/jpg")
spa.save

spa = Spa.create!(name: "Sothys", address: "20 rue de la paix 69000 Lyon", price_per_hour: "50", category: "sauna", rating: 4.5, user: User.second)
file = URI.open("https://www.sante-forme.com/img/cms/sauna-professionnel.jpg")
spa.photo.attach(io: file, filename: "sauna-professionnel.jpg", content_type: "image/jpg")
spa.save

spa = Spa.create!(name: "Perle d'O", address: "3 rue du ballon 59000 La Madeleine", price_per_hour: "60", category: "jacuzzi", rating: 3.6, user: User.second)
file = URI.open("https://www.eauzone-spa.com/images/centre_hellemmes/rio/rio_3.jpg")
spa.photo.attach(io: file, filename: "photo-rio-de-janeiro.jpg?w=1200&h=1200&s=1", content_type: "image/jpg")
spa.save

spa = Spa.create!(name: "Concept Spa", address: "10 avenue Pablo Picasso 33000 Bordeaux", price_per_hour: "80", category: "hammam", user: User.first)
file = URI.open("https://www.tooistanbul.com/wp-content/uploads/2019/12/hamam.jpg")
spa.photo.attach(io: file, filename: "hamam.jpg", content_type: "image/jpg")
spa.save

spa = Spa.create!(name: "Suite & Spa", address: "4 allée saint Benoit 44000 Nantes", price_per_hour: "50", category: "jacuzzi", user: User.second)
file = URI.open("https://www.eauzone-spa.com/images/centre_tourcoing/bali/bali_1.jpg")
spa.photo.attach(io: file, filename: "bali_1.jpg", content_type: "image/jpg")
spa.save
# -----------------------------------------Creation Booking------------------------------------------------------
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,11,23), end_date: Date.new(2022,11,26), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,05,02), end_date: Date.new(2022,05,10), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,05,11), end_date: Date.new(2022,05,15), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2023,01,10), end_date: Date.new(2023,01,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,10), end_date: Date.new(2022,12,20), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
