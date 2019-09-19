FactoryBot.define do

  factory :wallet do
    customer_id          {"cus_e086d775b532004f9c4f64784fbc"}
    card_id              {"car_4681f0e993f4da2772a11c0b195d"}
    association :user, factory: :user
  end

end