class Order < ApplicationRecord
  belongs_to :orders_history

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true
  validates :orders_history, presence: true
end
