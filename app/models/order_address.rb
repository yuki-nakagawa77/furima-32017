class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :area_id, numericality: { other_than: 1 }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  
  with_options presence: true do
    validates :municipalities
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end



  def save
    orders_history = OrderHistory.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order_history_id: orders_history.id)
  end
end