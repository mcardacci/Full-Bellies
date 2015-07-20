require 'Faker'

###  Vendor Data
vendor1 = Vendor.create(
  username: "ross",
  password: "123",
  email: "ross@example.com",
  name: "ross's pizza",
  bio: "Casual spot serving pizzas, family-style pasta & Italian favorites, with outdoor seating.",
  address: "2 Gold St, New York, NY 10038",
  phone_number: Faker::PhoneNumber.phone_number,
  avatar: "http://www.leeabbamonte.com/wp-content/uploads/2011/04/joesmainpizza.bmp"
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
  username: "marc",
  password: "123",
  email: "Marc@example.com",
  name: "Fresh Fanatic",
  bio: "Market featuring local, organic produce & groceries, plus a cafe & juice bar serving sandwiches.",
  address: "470 W 23rd St, New York, NY 10011",
  phone_number: Faker::PhoneNumber.phone_number
  )

vendor4 = Vendor.create(
  username: "John",
  password: "123",
  email: "john@example.com",
  name: "Fresh Food Deli & Grocery",
  bio: "Local family owned grocery store, specializing in fresh fruits and vegitables, as well as daily prepared sandwiches and wraps!",
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

vendor6 = Vendor.create(
  username: "Dan",
  password: "123",
  email: "dan@example.com",
  name: "The Green Table",
  bio: "Farm-to-table restaurant in Chelsea Market offers locally sourced, organic food & wine.",
  address: "Chelsea Market, 75 Ninth Ave, New York, NY 10011",
  phone_number: Faker::PhoneNumber.phone_number
  )

### Dummy Followers Data for each Vendor
20.times do
  vendor1.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor2.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor3.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

20.times do
  vendor4.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

10.times do
  vendor4.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

8.times do
  vendor5.users.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123",
    phone_number: Faker::PhoneNumber.phone_number,
    profile_pic:  Faker::Avatar.image)
end

### Deals Data
vendor1.deals.create(
  title: "10 delicious cheese pizzas, 90% off!",
  description: "These pizzas were cooked earlier tonight, but we don't want to toss them out!  Come grab a slice for only a buck!",
  item_quantity: 10,
  item_price: 1.00,
  end_time: Time.local(2015.to_i, 7.to_i, 16.to_i, 00.to_i, 00.to_i),
  )

vendor1.deals.create(
  title: "20 delicious bread sticks",
  description: "These bread sticks ain't gonna eat themselves and we don't wanna toss em in the trash!  Pick up a few breaksticks with your pizza - feed the family on a budget!",
  item_quantity: 10,
  item_price: 0.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor2.deals.create(
  title: "30 day old bagels",
  description: "Bagels were made fresh yesterday and are available for .50 until the end of the day.",
  item_quantity: 30,
  item_price: 0.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor3.deals.create(
  title: "50 Hass Avacodos available",
  description: "We have a few crates of some still delicious Hass Avocados.  They are just past the expiration period so rather than tossing them out, we are selling them at a nice discount.",
  item_quantity: 50,
  item_price: 4.00,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor4.deals.create(
  title: "24 packs of Brioche Burger Buns",
  description: "Perfect for the summer, we have 24 packs of Brioche Burger Buns that we need to move by the end of the night",
  item_quantity: 24,
  item_price: 1.00,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor5.deals.create(
  title: "We made too many! 40 of the best Tacos in NYC!",
  description: "Don't miss dis fish! We have 40 of the best fish Tacos in Manhattan available for $.75 each. We don't want to waste these things so click through and come pick up a nice summer dinner for you and the fam!",
  item_quantity: 40,
  item_price: 0.75,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor2.deals.create(
  title: "30 muffins available from last night!",
  description: "Start the day off with a deal on muffins for $.50 each!  These muffins are left over from last night but we have to get rid of them to make room for the morning rush!",
  item_quantity: 30,
  item_price: 0.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor6.deals.create(
  title: "25 servings of our special Mac & Cheese",
  description: "We've got a ton of Mac & Cheese leftover from an event tonight!  Staying true to our name we don't want to waste one serving of this dish.  Enjoy our unique take on Mac & Cheese with goat cheese, Colby, cheddar & parmesan, herbed breadcrumbs.",
  item_quantity: 25,
  item_price: 1.00,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )

vendor6.deals.create(
  title: "18 Red Quinoa Falafel Platters",
  description: "Red Quinoa Falafel Platter – tahini, warm chick peas, seasonal pickles, fresh herbs, naan bread",
  item_quantity: 18,
  item_price: 2.50,
  end_time: Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i),
  )
