class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address_number, :building, :telephone, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Inclue hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_number
    validates :telephone, format: { with: /\A\d{,11}\z/, message: "must be less than 11 degit without hyphen(-)" }
    validates :token
  end

  def save
    user = User.find(user_id)
    item = Item.find(item_id)
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address_number: address_number, building: building, telephone: telephone)
  end
end