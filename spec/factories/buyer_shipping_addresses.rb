FactoryBot.define do
  factory :buyer_shipping_address do

    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '東京都' }
    house_number  { '1-2-3' }
    phone_number  { '09012345678' }
    token { Faker::Alphanumeric.alphanumeric(number: 16) }

  end
end
