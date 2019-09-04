FactoryBot.define do

  factory :user do
    nickname              {"斎藤"}
    email                 {"llllll@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    family_name          {"田中"}
    family_name_kana     {"タナカ"}
    birthday              {"2017-01-01"}
    phone_number          {"0000-000-000"}
  end

end