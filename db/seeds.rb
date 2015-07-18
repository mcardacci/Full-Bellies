require 'Faker'

###  Vendor Data
vendor1 = Vendor.create(
  username: "ross",
  password: "123",
  email: "ross@example.com",
  name: "ross's pizza",
  bio: "Casual spot serving pizzas, family-style pasta & Italian favorites, with outdoor seating.",
  address: "2 Gold St, New York, NY 10038",
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

vendor5 = Vendor.create(
  username: "Bob",
  password: "123",
  email: "bob@example.com",
  name: "Bob's Tacos",
  bio: "Chef Bob Bloomfield's take on upscale Mexican street food in a vibrant, colorful setting.",
  address: "145 E 39th St, New York, NY 10016",
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

10.times do
  vendor4.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

### Deals Data
vendor1.deals.create(
  title: "10 delicious cheese pizzas",
  description: "These pizzas are good and about to be trashed.  Come grab one at 90% discount",
  item_quantity: 10,
  item_price: 1.00,
  end_time: Time.local(2015.to_i, 7.to_i, 16.to_i, 00.to_i, 00.to_i),
  )

vendor1.deals.create(
  title: "20 delicious bread sticks",
  description: "These bread sticks ain't gonna eat themselves and we don't wanna waste em!",
  item_quantity: 10,
  item_price: 0.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor2.deals.create(
  title: "30 day old bagels",
  description: "Bagels were made fresh yesterday and are available for .50 until the end of the day",
  item_quantity: 30,
  item_price: 0.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor3.deals.create(
  title: "15 servings of Lasagna from lunch today",
  description: "Some of the best lasagna in New York is leftover from our dinner service - available til close tonight",
  item_quantity: 15,
  item_price: 4.00,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor4.deals.create(
  title: "25 fresh kobe beef burgers going quick!",
  description: "Today is your lucky day, we have 25 of the best burgers in NYC available for $3.00 each",
  item_quantity: 25,
  item_price: 3.00,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor5.deals.create(
  title: "22 delicoous tacos de pescado going quick!",
  description: "Don't miss dis fish! We have 2w of the best fish Tacos in Manhattan available for $.75 each",
  item_quantity: 25,
  item_price: 0.75,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )



