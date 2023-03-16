FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '東京都' }
    house_number  { '千代田区' }
    building      { '千代田1-1' }
    phone_number  { '09012345678' }
  end
end
