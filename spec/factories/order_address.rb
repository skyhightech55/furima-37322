FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone { '09012345678' }
  end
end
