class User < ApplicationRecord
  has_many :item
  has_many :order
  has_meny :order_history
end
