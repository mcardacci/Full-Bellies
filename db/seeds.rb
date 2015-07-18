# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'Faker'


vendor = Vendor.create(
  username: "ross",
  password: "123",
  email: "ross@example.com",
  name: "ross's pizza",
  bio: Faker::Lorem.sentence(3),
  address: Faker::Address.street_address,
  phone_number: Faker::PhoneNumber.phone_number
  )


30.times do
  vendor.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end