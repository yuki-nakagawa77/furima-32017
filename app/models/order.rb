class Order < ApplicationRecord
  #include ActiveModel::Model
  #attr_accessor :price

  belongs_to :order_history


end
