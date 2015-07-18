require 'Faker'

###  Vendor Data
vendor1 = Vendor.create(
  username: "ross",
  password: "123",
  email: "ross@example.com",
  name: "ross's pizza",
  bio: "Casual spot serving pizzas, family-style pasta & Italian favorites, with outdoor seating.",
  address: "2 Gold St, New York, NY 10038"
  phone_number: Faker::PhoneNumber.phone_number
  )

vendor2 = Vendor.create(
  username: "lowell",
  password: "123",
  email: "lowell@example.com",
  name: "lowell's bagels",
  bio: "Hand-rolled bagels, traditional spreads & deli staples are offered at this breakfast-&-lunch nook.",
  address: "3 Hanover Square # 6, New York, NY 10005",
  phone_number: Faker::PhoneNumber.phone_number
  )

vendor3 = Vendor.create(
  username: "Marc",
  password: "123",
  email: "Marc@example.com",
  name: "Marc's Lasagna",
  bio: "Lasagna specialist serving meat, seafood & vegetarian versions plus other Italian standards.",
  address: "470 W 23rd St, New York, NY 10011",
  phone_number: Faker::PhoneNumber.phone_number
  )

vendor4 = Vendor.create(
  username: "John",
  password: "123",
  email: "john@example.com",
  name: "John's Burgers",
  bio: "Burger shop with long list of options also serving hot dogs in a basic, bright corner space.",
  address: "77 Pearl St #6, New York, NY 10004",
  phone_number: Faker::PhoneNumber.phone_number
  )

### Followers Data for each Vendor
20.times do
  vendor1.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor2.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor3.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor4.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

### Deals Data

