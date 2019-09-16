FactoryBot.define do
  factory :product, class: Product do
    name { Faker::Games::Pokemon.name } 
    price               {"100"}
    description {Faker::Movies::BackToTheFuture.quote}
    brand_id            {"1"}
    postage_id          {"1"}
    shipping_method_id  {"1"}
    size_id	            {"1"}
    shipping_date_id    {"1"}
    condition_id        {"1"}
    category_id         {"1"}
    # binding.pry
    association :user, factory: :user
    association :address, factory: :address
    
    

  end
end