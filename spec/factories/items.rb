FactoryBot.define do
  factory :item do
    item_name            { Faker::Name.initials(number: 1) }     
    text                 { Faker::Lorem.sentence }
    state_id             { Faker::Number.between(from: 2, to: 7) }
    burden_id            { Faker::Number.between(from: 2, to: 3) }
    locality_id          { Faker::Number.between(from: 2, to: 48) }
    delivery_id          { Faker::Number.between(from: 2, to: 4) }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    price                { Faker::Number.between(from: 300, to: 9999999) }
    association :user                 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
