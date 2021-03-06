class OrderAddress

  include ActiveModel::Model
  attr_accessor  :token ,:item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name,:orders_id,:phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{10}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token, presence: true
   end

   def save
    order = Order.create(item_id: item_id , user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,building_name: building_name, phone_number: phone_number,order_id: order.id)
   end

end