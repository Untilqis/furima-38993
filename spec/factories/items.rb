FactoryBot.define do
  factory :item do
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    name              { Faker::Name.name }
    description       { Faker::Lorem.sentence }
    category_id       { 1 }
    condition_id      { 1 }
    shipping_cost_id  { 1 }
    prefecture_id     { 1 }
    shipping_date_id  { 1 }
    price             { 300 }
    
    association :user
  end
end
