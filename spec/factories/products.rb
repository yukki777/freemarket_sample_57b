FactoryBot.define do

  factory :product do
    name                {"商品名"}
    price               {"価格"}
    description         {"こんにちは"}
    user_id	            {"1"}
    address_id          {"1"}
    brand_id            {"1"}
    postage_id          {"1"}
    shipping_method_id  {"1"}
    size_id	            {"1"}
    shipping_date_id    {"1"}
    condition_id        {"1"}
  end
end