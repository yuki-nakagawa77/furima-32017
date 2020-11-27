class Order < ApplicationRecord
  belongs_to :user
  has_many   :item
  has_many   :order_history
end
