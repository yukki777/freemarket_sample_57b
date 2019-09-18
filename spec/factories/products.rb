FactoryBot.define do
  factory :product, class: Product do
    name { Faker::Games::Pokemon.name } 
    price {rand(10000)}
    description {Faker::Games::Pokemon.move}
    brand_id {"1"}
    postage_id {"1"}
    shipping_method_id {"1"}
    size_id	{"1"}
    shipping_date_id {"1"}
    condition_id {"1"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    association :category, factory: :category
    association :user, factory: :user
    association :address, factory: :address
    
    

  end
end