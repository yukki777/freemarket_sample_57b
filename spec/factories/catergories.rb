FactoryBot.define do
  factory :category, class: Category do
    name {Faker::Games::Zelda}
  end
end