FactoryBot.define do
  factory :buyer_address do
    postal_code         { '000-0000' }
    locality_id         { Faker::Number.between(from: 2, to: 48) }
    municipality        { '新宿区新宿' }
    street              { '0-0-0' }
    building            { '東京ハイツ' }
    phone               { "00000000000" }
  end
end
