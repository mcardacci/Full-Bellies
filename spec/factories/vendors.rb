FactoryGirl.define do
  factory :vendor do
    username {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password "123"
    phone_number {Faker::PhoneNumber.phone_number}
    name {Faker::Company.name}
    address {Faker::Address.street_address}
    bio {Faker::Company.catch_phrase}


    factory :invalid_vendor do
      username nil
    end
  end
end
