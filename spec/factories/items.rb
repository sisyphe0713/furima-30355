FactoryBot.define do
  factory :item do
    association :user
    name {"item"}
    price	{"300"}
    text {Faker::Lorem.sentence}
    category_id	{"2"}
    status_id	{"2"}
    delivery_fee_id	{"2"}
    prefecture_id	{"2"}
    ship_day_id {"2"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
