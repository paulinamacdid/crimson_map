# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"


puts "cleaning the database first..."

Review.destroy_all
Favourite.destroy_all
Facility.destroy_all
User.destroy_all
Blog.destroy_all

puts "creating users..."

gabriela = User.create(email: "gabbyb@gmail.com", password: "123456", first_name: "Gabriela", last_name: "Propodopolis", age: 24)
pamela = User.create(email: "pamela@gmail.com", password: "123456", first_name: "Pamela", last_name: "Gordon", age: 34)
ivy = User.create(email: "ivy@gmail.com", password: "123456", first_name: "Ivy", last_name: "Johnson", age: 29)
melissa = User.create(email: "mel123@gmail.com", password: "123456", first_name: "Melissa", last_name: "Walter", age: 42)
abi = User.create(email: "abi123@gmail.com", password: "123456", first_name: "Abi", last_name: "Blenson", age: 46)

puts "creating facilities..."
oru = Facility.create!(address: "6 Virginia Close, KT3 3RB New Malden",
                      business_owner: false,
                      rating: 4.0,
                      toilet: true,
                      sanitary_products: true,
                      baby_change: true,
                      quiet_place: true,
                      education: false,
                      name: "Oru",
                      opening_hours: "Open 08:30 - 16:00",
                      user: melissa,
                      image: "https://images.squarespace-cdn.com/content/v1/63d2989b2d4c0421d7d241d5/e002a445-b5a6-46a9-bd85-8c5e1033ded2/SRG_Oru_SUTTON_CROWDFUNDER_ORIGINAL-22.jpg")
sutton_library = Facility.create!(address: "St Nicholas Way, Sutton SM1 1EA",
                                  business_owner: false,
                                  rating: 4.0,
                                  toilet: true,
                                  sanitary_products: true,
                                  baby_change: true,
                                  quiet_place: true,
                                  education: true,
                                  name: "Sutton Library",
                                  opening_hours: "Open 09:00 - 17:00",
                                  user: melissa,
                                  image: "https://thedesignconcept.co.uk/media/24274/sutton_uk_006.jpg?mode=pad&width=1350&height=900&bgcolor=ffffff&rnd=131835698170000000")
dobbies = Facility.create!(address: "28 Willow Rd, New Malden KT3 3RS",
                          business_owner: true,
                          rating: 4,
                          toilet: true,
                          sanitary_products: false,
                          baby_change: true,
                          quiet_place: false,
                          education: false,
                          name: "Dobbies",
                          opening_hours: "Open 08:00 - 16:30",
                          user: melissa,
                          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPx6DmpdKa_5OLtnPCfyzPE2BxTTPgFFzvlQ&s")
carshalton_station = Facility.create!(address: "Carshalton SM5 2HW",
  business_owner: false,
  rating: 2,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Carshalton Station",
  opening_hours: "Open 06:00 - 00:00",
  user: melissa,
  image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Carshalton_Railway_Station_-_geograph.org.uk_-_1553600.jpg")
british_library = Facility.create!(address: "96 Euston Rd., London NW1 2DB",
  business_owner: true,
  rating: 4.5,
  toilet: true,
  sanitary_products: false,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "British Library",
  opening_hours: "Open 09:30 - 20:00",
  user: melissa,
  image: "https://wp.inews.co.uk/wp-content/uploads/2017/10/shutterstock_554370322-e1507803540641.jpg")
pret = Facility.create!(address: "Kingston Rd, New Malden KT3 3RX",
  business_owner: true,
  rating: 1,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Pret",
  user: ivy,
  opening_hours: "Open 07:30 - 19:00",
  image: "https://www.londondesigneroutlet.com/wp-content/uploads/2023/06/pret-a-manger-london-designer-outlet-00.jpg",)
bella_caffe = Facility.create!(address: "150 Kingston Rd, New Malden KT3 3RD",
  business_owner: false,
  rating: 2,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Bella Caffe",
  user: ivy,
  opening_hours: "Open 06:30 - 04:30",
  image: "https://lh3.googleusercontent.com/p/AF1QipOtzldFQ0ivO1zohl36AB_8C76qLNJ9DZAan5Pg=s1360-w1360-h1020",
)
mad_coffee_bar = Facility.create!(address: "61 Lind Rd, Sutton SM1 4PP",
  business_owner: false,
  rating: 4,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Mad Coffee Bar",
  user: ivy,
  opening_hours: "Open 07:00 - 18:00",
  image: "https://lh3.googleusercontent.com/p/AF1QipO0sIu4qAJU3iGkq10gPJRyPQ5M7nhGYr3AgqJb=s1360-w1360-h1020",
)
the_grove_womens_toilets = Facility.create!(address: "Carshalton SM5 3BB",
  business_owner: false,
  rating: 1.5,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "The Grove Women's Toilets",
  opening_hours: "Open 00:00 - 00:00",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipP7MkzZJd4wNNEHwELw-ureDD_cgvvLXGHrzvwC=s1360-w1360-h1020",
)
public_toilet_free = Facility.create!(address: "97 Banstead Rd, Carshalton SM5 3NP",
  business_owner: false,
  rating: 3,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Public Toilet £0 Free (Male / Female)",
  opening_hours: "Open 16:00 - 22:30",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipOlWxA422fEgK500xx2_JvtbbFzqNh_v0sPx6GV=s1360-w1360-h1020",)
pulse_health_and_fitness = Facility.create!(address: "Nightingale Rd, Carshalton SM5 2EJ",
  business_owner: false,
  rating: 3,
  toilet: false,
  sanitary_products: true,
  baby_change: true,
  quiet_place: false,
  education: false,
  name: "Pulse Health & Fitness",
  opening_hours: "Open 06:30 - 21:00",
  user: ivy,
  image: "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/10/Pulse-Carshalton-193-scaled.jpg",
)
sheenas_free_little_library = Facility.create!(address: "51 Windsor Ave, New Malden KT3 5HE",
  business_owner: false,
  rating: 3.5,
  toilet: true,
  sanitary_products: true,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "Sheena’s Free Little Library",
  opening_hours: "Open 07:00 - 19:30",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipOtmli6c8lQU3xCFMBAWpODAoZRNMqXuXCwl867=s1360-w1360-h1020",)

puts "done, created #{Facility.count} facilities"

puts "creating reviews..."

Review.create!(comment: "Toilet works fine, but lacks comfort and features. Could definitely be improved.", rating: 3, facility: oru, user: gabriela)
Review.create!(comment: "Great toilet, always clean, but disappointed the free sanitary products were out last time.", rating: 3, facility: sutton_library, user: pamela)
Review.create!(comment: "What a lovely little library with free organic sanitary products. Sheena, the owner, even offered me a free hot chocolate. It was such a welcoming touch I'll definitely be back", rating: 5, facility: sheenas_free_little_library, user: pamela)
Review.create!(comment: "a surprisingly gorgeous spot to change sanitary products, great ambience, very clean, many toilets", rating: 4, facility: british_library, user: ivy)

puts "creating blogs..."

Blog.create!(title: "Endometriosis at Work", content: "One in six people with endometriosis have to leave the workplace and is a condition that costs the economy £8.2 billion per year in loss of work and healthcare costs.
                      This is unacceptable- nobody should face discrimination at work or risk losing their job because of their endometriosis, and we’re determined to work with the Government to ensure they protect those with menstrual health conditions in the new Bill.
                      Earlier this month, the Government introduced an Employment Rights Bill that aims to cut down on unfair working practices. Endometriosis UK welcomes the Bill, including measures to support those going through the menopause. But the Bill must go further to ensure measures are introduced to ensure those with endometriosis have the support and protections they need in the workplace.
                      Over the coming weeks and months, Endometriosis UK will be lobbying for changes to the Employment Rights Bill to ensure all those with menstrual health conditions, including endometriosis, have access to the support they need at work. We would like to see:
                      Menopause action plans extended to all those impacted by menstrual health conditions including endometriosis
                      Legislation to ensure workers with menstrual health conditions are treated fairly if they need short but intermittent time off work, as a result of their condition.
                      The Bill is due to receive its second reading in the House of Commons this afternoon (Monday 21st October 2024).
                      You can support the campaign by emailing your MP. Our easy-to-use template will generate an email to your MP using your postcode.",
                      author: "Sally Campbell", url: "https://www.endometriosis-uk.org/new-campaign-endometriosis-work")

puts "done, created #{Blog.count} blog"

api_token = ENV['GOOGLE_API_KEY']
url = "https://places.googleapis.com/$discovery/rest?version=v1&key=#{api_token}"
facilities_serialized = URI.parse(url).read
places = JSON.parse(facilities_serialized)

puts places
# places["places"].each do |place|
#   Facility.create!(name: place["places"], address:, opening_hours:, toilet: )
# # end
