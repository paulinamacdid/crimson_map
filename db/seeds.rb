# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "cleaning the database first..."
User.destroy_all
Facility.destroy_all

puts "creating users..."

gabriela = User.create(email: "gabbyb@gmail.com", password: "123456", first_name: "Gabriela", last_name: "Propodopolis", age: 24)
pamela = User.create(email: "pamela@gmail.com", password: "123456", first_name: "Pamela", last_name: "Gordon", age: 34)
ivy = User.create(email: "ivy@gmail.com", password: "123456", first_name: "Ivy", last_name: "Johnson", age: 29)
melissa = User.create(email: "mel123@gmail.com", password: "123456", first_name: "Melissa", last_name: "Walter", age: 42)

puts "creating facilities..."
oru = Facility.create(address: "7 Throwley Way, Sutton SM1 4AF", business_owner: false, rating: 3.5, toilet: 8, sanitary_products: true, baby_change: true, quiet_place: true, education: false, name: "Oru")
sutton_library = Facility.create(address: "St Nicholas Way, Sutton SM1 1EA", business_owner: false, rating: 4, toilet: 5, sanitary_products: false, baby_change: true, quiet_place: true, education: true, name: "Sutton Library")
dobbies = Facility.create(address: "4a Woodmansterne Ln, Wallington SM6 0SU", business_owner: true, rating: 4, toilet: 3, sanitary_products: false, baby_change: true, quiet_place: false, education: false, name: "Dobbies")
carshalton_station = Facility.create(address: "Carshalton SM5 2HW", business_owner: false, rating: 2, toilet: 3, sanitary_products: false, baby_change: false, quiet_place: false, education: false, name: "Carshalton Station")
british_library = Facility.create(address: "96 Euston Rd., London NW1 2DB", business_owner: true, rating: 4.5, toilet: 12, sanitary_products: false, baby_change: true, quiet_place: true, education: true, name: "British Library")
