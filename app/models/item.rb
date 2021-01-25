class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :ship_day_id
    validates :image
  end

  # ActiveHashを用いたもの
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :delivery_fee, :prefecture, :ship_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :ship_day_id
  end
end
