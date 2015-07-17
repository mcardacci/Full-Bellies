FactoryGirl.define do
  factory :deal do
    title {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence(3)}
    item_quantity {Faker::Number.number(2)}
    item_price {Faker::Commerce.price}

    factory :invalid_deal do
      username nil
    end
  end
end
