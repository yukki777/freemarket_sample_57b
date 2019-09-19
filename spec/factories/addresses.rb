FactoryBot.define do
  factory :address, class: Address do
    postal_code {"123-4567"}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Dessert.variety}

    trait :prefecture do
      prefecture
    end
    association :prefecture, factory: :prefecture
    association :user, factory: :user

  end
end