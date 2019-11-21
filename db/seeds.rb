# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
Booking.destroy_all
Flat.destroy_all
User.destroy_all

molly = User.create!(password: "123123", dob: Date.new(1994,10,12), email: "mdaguilar66@gmail.com", first_name: "Molly", last_name: "Daguilar")
bruno = User.create!(password: "123123", dob: Date.new(1990,5,8), email: "adenis.bruno@hotmail.com", first_name: "Bruno", last_name: "Adenis")
cecilia = User.create!(password: "123123", dob: Date.new(1985,7,10), email: "ceciliamarcellesi@gmail.com", first_name: "Cecilia", last_name: "Marcellesi")
lucas = User.create!(password: "123123", dob: Date.new(1998,3,18), email: "lucaschanet@gmail.com", first_name: "Lucas", last_name: "Chanet")

url = URI.open('https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80')
shoreditch = Flat.new(title:"Modern Shoreditch flat", location: "138 kingsland road", description: "Spacious and in the center of the city.", price: 150, user: cecilia)
shoreditch.photos.attach(io: url, filename: 'shoreditch.jpg', content_type: 'image/jpg')
shoreditch.save

url2 = URI.open('https://images.unsplash.com/photo-1569763597365-ea6ea8755f01?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2775&q=80')
treehouse = Flat.create!(title:"Treehouse in China", location: "China", description: "The Ohana in a tropical jungle setting will be your home while visiting the Big Island. A place to relax and commune with nature.", price: 31, user: molly)
treehouse.photos.attach(io: url2, filename: 'treehouse.jpg', content_type: 'image/jpg')
treehouse.save

url3 = URI.open('https://image.redbull.com/rbcom/010/2015-05-20/1331724217316_2/0100/0/1/sefton-mountain-hut.jpg')
mountain = Flat.create!(title:"Remote mountain hut", location: "Japan", description: "Cosy getaway nestled in the beautiful mountains of Japan.", price: 99, user: lucas)
mountain.photos.attach(io: url3, filename: 'mountain.jpg', content_type: 'image/jpg')
mountain.save

url4 = URI.open('https://www.southfrancevillas.com/images/2017/4-luxury-french-riviera-villa.jpg')
frenchvilla = Flat.create!(title:"Luxury villa in France", location: "France", description: "This family friendly villa adorned wth sleek, modern style will give you a unique experience for your stay at Bandung.", price: 180, user: bruno, guest: 8, bedrooms: 4)
frenchvilla.photos.attach(io: url4, filename: 'frenchvilla.jpg', content_type: 'image/jpg')
frenchvilla.save

url5 = URI.open('https://d1nabgopwop1kh.cloudfront.net/hotel-asset/20231034000070449_wh_6')
palace = Flat.create!(title:"The Cosy Palace", location: "Marrakech", description: "Let this be your Unique experience in Marrakech!", price: 115, user: cecilia)
palace.photos.attach(io: url5, filename: 'palace.jpg', content_type: 'image/jpg')
palace.save

url6 = URI.open('https://lid.zoocdn.com/645/430/7b124fab17e4cb33712a43e51f74153e8cc66304.jpg')
clapton = Flat.create!(title:"Quirky flat near Hackney", location: "34 Mildenhall Road", description: "Full of character with good transport links nearby", price: 100, user: cecilia)
clapton.photos.attach(io: url6, filename: 'clapton.jpg', content_type: 'image/jpg')
clapton.save

url7 = URI.open('https://i.dailymail.co.uk/i/pix/2014/01/18/article-0-1AC3AA2500000578-340_634x620.jpg')
chelsea = Flat.create!(title:"Grand house in Chelsea", location: "10 Kings Road", description: "Walk out to be in the middle of the action on Kings Road.", price: 300, user: cecilia)
chelsea.photos.attach(io: url7, filename: 'chelsea.jpg', content_type: 'image/jpg')
chelsea.save

url8 = URI.open('https://media.rightmove.co.uk/dir/32k/31836/73805323/31836_29055770_IMG_01_0000_max_656x437.jpg')
brixton = Flat.create!(title:"Attic space in Brixton", location: "24 Beechdale Road", description: "Quiet location just round the corner from the buzz of Brixton village", price: 190, user: cecilia)
brixton.photos.attach(io: url8, filename: 'brixton.jpg', content_type: 'image/jpg')
brixton.save

Booking.create!(user: molly, flat: mountain, start_date: Date.new(2020,5,5), end_date: Date.new(2020,5,10), guest: 3, price: 495)
Booking.create!(user: cecilia, flat: treehouse, start_date: Date.new(2019,12,1), end_date: Date.new(2019,12,15), guest: 2, price: 434)
Booking.create!(user: lucas, flat: shoreditch, start_date: Date.new(2019,12,15), end_date: Date.new(2019,12,20), guest: 2, price: 750)
Booking.create!(user: bruno, flat: palace, start_date: Date.new(2020,1,12), end_date: Date.new(2020,1,20), guest: 4, price: 920)
Booking.create!(user: lucas, flat: palace, start_date: Date.new(2020,2,14), end_date: Date.new(2020,2,16), guest: 6, price: 230)
Booking.create!(user: molly, flat: chelsea, start_date: Date.new(2020,4,10), end_date: Date.new(2020,4,15), guest: 6, price: 1500)
Booking.create!(user: molly, flat: brixton, start_date: Date.new(2020,7,20), end_date: Date.new(2020,7,22), guest: 2, price: 380)
Booking.create!(user: lucas, flat: clapton, start_date: Date.new(2020,5,2), end_date: Date.new(2020,5,5), guest: 3, price: 300)


puts "Finished!"
