FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password "123"
    phone_number {Faker::PhoneNumber.phone_number}
    profile_pic {Faker::Avatar.image}

    factory :invalid_user do
      username nil
    end
  end
end
