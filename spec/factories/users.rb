FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'智也'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'トモヤ'}
    date_of_birth         {Faker::Date.birthday}
  end
end