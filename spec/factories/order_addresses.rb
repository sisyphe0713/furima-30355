FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    address_number { '青山1-1-1' }
    building { '柳ビル103' }
    telephone { '09012345678' }
    user_id { 1 }
    item_id { 1 } 
    token { "tok_abcdefghijk00000000000000000" }
  end
end
