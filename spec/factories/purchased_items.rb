FactoryGirl.define do
  factory :purchased_item do

    association :user
    title {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence(3)}
    quantity {Faker::Number.between(1, 10)}
    price {Faker::Number.between(1, 10)}

    factory :invalid_purchased_item do
      item_price nil
    end
  end
end
