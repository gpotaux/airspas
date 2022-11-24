require "open-uri"
# Supprimer les model - Clean DB

puts "Destroying reviews.."
Review.destroy_all
puts "Reviews destroyed"

puts "Destroying Bookings.."
Booking.destroy_all
puts "Bookings destroyed"

puts "Destroying Spas.."
Spa.destroy_all
puts "Spas destroyed"

puts "Destroying Users.."
User.destroy_all
puts "Users destroyed"

# -----------------------------------------Création user
puts "Creating users.."

User.create!(first_name: "Louise", last_name: "Dupont", email: "louise.dupont@gmail.com", password: "123456")
User.create!(first_name: "Marc", last_name: "Leblanc", email: "marc.leblanc@gmail.com", password: "123456")

user1 = User.create!(first_name: "Ines", last_name: "Kalis", email: "ines.kalis@gmail.com", password: "123456")
user2 = User.create!(first_name: "Pierre", last_name: "Dupuis", email: "pierre.dupuis@gmail.com", password: "123456")

puts "#{User.count} users created"
# ------------------------------------------Création SPA---------------------

puts "Creating spas.."

spa1 = Spa.create!(name: "Ambispa", address: "65 Rue Henri Barbusse 75000 Paris", price_per_hour: "80", category: "jacuzzi", user: User.first)
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

spa5 = Spa.create!(name: "Concept Spa", address: "80 rue du Tondu 33000 Bordeaux", price_per_hour: "80", category: "hammam", user: User.first)
file = URI.open("https://www.tooistanbul.com/wp-content/uploads/2019/12/hamam.jpg")
spa5.photo.attach(io: file, filename: "hamam.jpg", content_type: "image/jpg")
spa5.save

spa6 = Spa.create!(name: "Suite & Spa", address: "4 rue Pierre Benoit 44000 Nantes", price_per_hour: "50", category: "jacuzzi", user: User.second)
file = URI.open("https://www.eauzone-spa.com/images/centre_tourcoing/bali/bali_1.jpg")
spa6.photo.attach(io: file, filename: "bali_1.jpg", content_type: "image/jpg")
spa6.save

spa7 = Spa.create!(name: "Apsara Thai Spa", address: "50 Rue Barthélémy Delespaul 59000 Lille", price_per_hour: "60", category: "jacuzzi", user: User.first)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/de/81/4f/spa-privatif.jpg?w=1000&h=800&s=1")
spa7.photo.attach(io: file, filename: "apsara-thai-spa.jpg", content_type: "image/jpg")
spa7.save

spa8 = Spa.create!(name: "Hammam Kechmara", address: "20 Rue de la Toussaint 67000 Strasbourg", price_per_hour: "90", category: "hammam", user: User.first)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/fa/ed/3f/salle-de-repos.jpg?w=1000&h=800&s=1")
spa8.photo.attach(io: file, filename: "hammam-kechmara.png", content_type: "image/jpg")
spa8.save

spa9 = Spa.create!(name: "Saöna Spa", address: "66 Rue Martainville, 76000 Rouen", price_per_hour: "50", category: "jacuzzi", user: User.second)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/88/fe/bb/spa-privatif-avec-possibilite.jpg?w=1000&h=-1&s=1")
spa9.photo.attach(io: file, filename: "saona-spa.jpg", content_type: "image/jpg")
spa9.save

spa10 = Spa.create!(name: "Zeîn Oriental Spa", address: "1 Rue Emile Romanet 74000 Annecy", price_per_hour: "80", category: "sauna", user: User.second)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/e8/76/bf/spa-de-l-hermitage-gantois.jpg?w=1000&h=800&s=1")
spa10.photo.attach(io: file, filename: "photo-zein", content_type: "image/jpg")
spa10.save

spa11 = Spa.create!(name: "Spa by Clarins", address: "50 Rue Carnot, 26500 Bourg-lès-Valence", price_per_hour: "80", category: "hammam", user: User.first)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/d3/50/e1/notre-bassin-d-hiver.jpg?w=1000&h=800&s=1")
spa11.photo.attach(io: file, filename: "hamam-8.jpg", content_type: "image/jpg")
spa11.save

spa12 = Spa.create!(name: "Lok Siam Spa", address: "2 Pl. Emile Cresp, 92120 Montrouge", price_per_hour: "50", category: "sauna", user: User.second)
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/07/14/95/lok-siam-spa-ternes-offre.jpg?w=1000&h=800&s=1")
spa12.photo.attach(io: file, filename: "bali_4.jpg", content_type: "image/jpg")
spa12.save

puts "#{Spa.count} spas created"
# -----------------------------------------Creation Booking------------------------------------------------------
puts "Creating bookings.."

Booking.create!(user: [user1, user2].sample, spa: spa1, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa2, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa3, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa4, start_date: Date.new(2022,12,02), end_date: Date.new(2022,12,05), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa5, start_date: Date.new(2022,11,23), end_date: Date.new(2022,11,26), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa6, start_date: Date.new(2022,05,02), end_date: Date.new(2022,05,10), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa1, start_date: Date.new(2022,05,11), end_date: Date.new(2022,05,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa2, start_date: Date.new(2023,01,10), end_date: Date.new(2023,01,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa3, start_date: Date.new(2022,12,10), end_date: Date.new(2022,12,20), status:"pending")

Booking.create!(user: [user1, user2].sample, spa: spa7, start_date: Date.new(2022,12,12), end_date: Date.new(2022,12,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa8, start_date: Date.new(2022,12,12), end_date: Date.new(2022,12,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa9, start_date: Date.new(2022,12,12), end_date: Date.new(2022,12,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa10, start_date: Date.new(2022,12,12), end_date: Date.new(2022,12,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa11, start_date: Date.new(2022,11,29), end_date: Date.new(2022,11,30), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa12, start_date: Date.new(2022,05,11), end_date: Date.new(2022,05,13), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa7, start_date: Date.new(2022,05,23), end_date: Date.new(2022,05,29), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa8, start_date: Date.new(2023,01,10), end_date: Date.new(2023,01,15), status:"pending")
Booking.create!(user: [user1, user2].sample, spa: spa9, start_date: Date.new(2022,12,10), end_date: Date.new(2022,12,20), status:"pending")

puts "#{Booking.count} bookings created"

# -----------------------------------------Creation Reviews------------------------------------------------------
puts "Creating reviews.."

Booking.all.each do |booking|
  3.times { Review.create!(rating: (3..5).to_a.sample, booking: booking) }
end

puts "#{Review.count} reviews created"
