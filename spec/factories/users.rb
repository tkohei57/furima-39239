FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                   { Faker::Name.name }
    email                      { Faker::Internet.free_email }
    # password                   { "a1" + Faker::Internet.password(min_length: 4) }
    password                   { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation      { password }
    last_name                  { person.last.kanji }
    first_name                 { person.first.kanji }
    kana_last_name             { person.last.katakana }
    kana_first_name            { person.first.katakana }
    date_of_birth              { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
