class Item < ApplicationRecord
  belongs_to :user
  has_many :order
  has_many :order_history

end
