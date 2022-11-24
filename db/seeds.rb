require "open-uri"
# Supprimer les model - Clean DB

puts "Destroying Booking.."
Booking.destroy_all
puts "Booking destroyed"

puts "Destroying Spa.."
Spa.destroy_all
puts "Spa destroyed"

puts "Destroying User.."
User.destroy_all
puts "User destroyed"

# -----------------------------------------Création user
puts "Creating users.."

User.create!(first_name: "Louise", last_name: "Dupont", email: "louise.dupont@gmail.com", password: "123456")
User.create!(first_name: "Marc", last_name: "Leblanc", email: "marc.leblanc@gmail.com", password: "123456")

user1 = User.create!(first_name: "Ines", last_name: "Kalis", email: "ines.kalis@gmail.com", password: "123456")
user2 = User.create!(first_name: "Pierre", last_name: "Dupuis", email: "pierre.dupuis@gmail.com", password: "123456")

puts "#{User.count} users created"
# ------------------------------------------Création SPA---------------------

puts "Creating spas.."

spa1 = Spa.create!(name: "Ambispa", address: "60 rue de Paris 75000 Paris", price_per_hour: "80", category: "jacuzzi", user: User.first)
file = URI.open("https://ambispa.fr/wp-content/uploads/2018/10/Ambi-spa-privatif-Lille-detente-02.jpg")
spa1.photo.attach(io: file, filename: "Ambi-spa-privatif-Lille-detente-02.jpg", content_type: "image/jpg")
spa1.save

spa2 = Spa.create!(name: "Perle de douceur", address: "80 avenue de la liberté 59000 Lille", price_per_hour: "70", category: "hammam", user: User.first)
file = URI.open("https://chercheursdebeaute.cinqmondes.com/files/2020/09/hammam.jpg")
spa2.photo.attach(io: file, filename: "hammam.png", content_type: "image/jpg")
spa2.save

spa3 = Spa.create!(name: "Sothys", address: "20 rue de la paix 69000 Lyon", price_per_hour: "50", category: "sauna", user: User.second)
file = URI.open("https://www.sante-forme.com/img/cms/sauna-professionnel.jpg")
spa3.photo.attach(io: file, filename: "sauna-professionnel.jpg", content_type: "image/jpg")
spa3.save

spa4 = Spa.create!(name: "Perle d'O", address: "3 rue du ballon 59000 La Madeleine", price_per_hour: "60", category: "jacuzzi", user: User.second)
file = URI.open("https://www.eauzone-spa.com/images/centre_hellemmes/rio/rio_3.jpg")
spa4.photo.attach(io: file, filename: "photo-rio-de-janeiro.jpg?w=1200&h=1200&s=1", content_type: "image/jpg")
spa4.save

spa5 = Spa.create!(name: "Concept Spa", address: "10 avenue Pablo Picasso 33000 Bordeaux", price_per_hour: "80", category: "hammam", user: User.first)
file = URI.open("https://www.tooistanbul.com/wp-content/uploads/2019/12/hamam.jpg")
spa5.photo.attach(io: file, filename: "hamam.jpg", content_type: "image/jpg")
spa5.save

spa6 = Spa.create!(name: "Suite & Spa", address: "4 allée saint Benoit 44000 Nantes", price_per_hour: "50", category: "jacuzzi", user: User.second)
file = URI.open("https://www.eauzone-spa.com/images/centre_tourcoing/bali/bali_1.jpg")
spa6.photo.attach(io: file, filename: "bali_1.jpg", content_type: "image/jpg")
spa6.save

puts "#{Spa.count} spas created"
# -----------------------------------------Creation Booking------------------------------------------------------
puts "Creating bookings.."

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,11,23), end_date: Date.new(2022,11,26), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,05,02), end_date: Date.new(2022,05,10), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,05,11), end_date: Date.new(2022,05,15), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2023,01,10), end_date: Date.new(2023,01,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,10), end_date: Date.new(2022,12,20), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: Spa.all.sample, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")

puts "#{Booking.count} bookings created"

# -----------------------------------------Creation Reviews------------------------------------------------------
puts "Creating reviews.."

3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa1) }
3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa2) }
3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa3) }
3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa4) }
3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa5) }
3.times { Review.create!(rating: (1..5).to_a.sample, spa: spa6) }

puts "#{Review.count} reviews created"
