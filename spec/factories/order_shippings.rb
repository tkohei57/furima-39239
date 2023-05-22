FactoryBot.define do
  factory :order_shipping do
    post_code { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_name }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits:10) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
