class OrderHistory < ApplicationRecord
  belongs_to :user
  has_many   :item
  has_meny   :order
end
