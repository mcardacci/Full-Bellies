FactoryGirl.define do
  factory :deal do

    association :vendor
    title {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence(3)}
    item_quantity {Faker::Number.between(1, 10)}
    item_price {Faker::Number.between(1, 10)}
    end_time Time.local(2016.to_i, 1.to_i, 1.to_i, 00.to_i, 00.to_i)

    factory :invalid_deal do
      item_price nil
    end
  end
end
