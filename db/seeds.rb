# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# user_2 = User.create!(
#   name: 'test 10',
#   email: 'test10@gmail.com',
#   company_name: 'test Ten Company',
#   address: 'on earth',
#   detail: 'this is test',
#   password: 'test102023',
#   phones: ["1234567890", "9876543210"]
# )

# house = House.create!(
#   name: 'test house',
#   bathroom: 2,
#   bedroom: 3,
#   country: 'test country',
#   home_status: 'for_test',
#   home_type: 'test_home',
#   longitude: 0,
#   latitude: 0,
#   price: 30.00,
#   update_date: "2023-06-16",
#   desc: 'this is for the test',
#   square: 3000,
#   city: 'test',
#   zipcode: '2034',
#   street: 'test street',
#   zone: 'test zone',
#   user: user_2
# )

# house.images.attach(
#   io: File.open('C:\Users\User\Downloads\Telegram Desktop\photo_2023-06-15_19-52-36.jpg'),
#   filename: 'photo_2023-06-15_19-52-36.jpg',
#   content_type: 'image/jpg'
# )

# house.images.attach(
#   io: File.open('C:\Users\User\Downloads\Telegram Desktop\photo_2023-06-15_19-52-36.jpg'),
#   filename: 'photo_2023-06-15_19-52-36.jpg',
#   content_type: 'image/jpg'
# )

# user = User.create!(
#   name: 'test 11',
#   email: 'test11@gmail.com',
#   company_name: 'Test Eleven Company',
#   address: '123 Main St',
#   detail: 'Some details',
#   password: 'test1120230'
# )

# phone_numbers = ["1234567890", "9876543210"]
# phone_numbers.each do |number|
#   user.phones.create!(number: number)
# end

new_user1 = User.create!(
  name: 'fullstack developer',
  email: 'today23062023@gmail.com',
  company_name: 'FullStack Developer',
  address: 'mandalay',
  detail: 'Some details',
  password: 'frontend12023'
)

phone_numbers = ["1234567890", "9876543210"]
phone_numbers.each do |number|
  new_user1.phones.create!(number: number)
end

house = House.create!(
  name: 'front-end developer house',
  bathroom: 2,
  bedroom: 3,
  country: 'myanmar',
  home_status: 'for_test',
  home_type: 'test_home',
  longitude: 21.9588,
  latitude: 96.0891,
  price: 3000.00,
  update_date: "2023-06-16",
  desc: 'this is for the test',
  square: 3000,
  city: 'test',
  zipcode: '2034',
  street: 'test street',
  zone: 'test zone',
  user: new_user1
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