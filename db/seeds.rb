# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user_2 = User.create!(
  name: 'test 6',
  email: 'test6@gmail.com',
  company_name: 'test Six Company',
  address: 'on earth',
  detail: 'this is test',
  password: 'test62023'
)

house = House.create!(
  name: 'test house',
  bathroom: 2,
  bedroom: 3,
  country: 'test country',
  home_status: 'for_test',
  home_type: 'test_home',
  longitude: 0,
  latitude: 0,
  price: 30.00,
  update_date: "2023-06-16",
  desc: 'this is for the test',
  square: 3000,
  city: 'test',
  zipcode: '2034',
  street: 'test street',
  zone: 'test zone',
  user: user_2
)

house.images.attach(
  io: File.open('C:\Users\User\Downloads\Telegram Desktop\photo_2023-06-15_19-52-36.jpg'),
  filename: 'photo_2023-06-15_19-52-36.jpg',
  content_type: 'image/jpg'
)

house.images.attach(
  io: File.open('C:\Users\User\Downloads\Telegram Desktop\photo_2023-06-15_19-52-36.jpg'),
  filename: 'photo_2023-06-15_19-52-36.jpg',
  content_type: 'image/jpg'
)
