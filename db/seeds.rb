# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
Flat.destroy_all

Flat.create(title:"Bright and Airy Garden Flat in London", location: "London", description: "Spacious and quiet neighbourhood", price:75)
Flat.create(title:"Romantic Cabana with view", location: "Armenia", description: "Located in the coffee region, in the Andean mountains of Colombia, South America, a charming cabana made from bamboo, with a great view and a 'sendero' or pathway through the bamboo forest which criss-crosses our 5 acre organic farm, leading down to a stream. A place to relax and commune with nature.", price:31)

puts "Finished!"
