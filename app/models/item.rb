class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :ship_day_id
  end
end
