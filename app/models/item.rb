class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  

  belongs_to :user
  has_one    :orders_history
  has_one_attached :image

  with_options presence: true, numericality: { other_than: 1 } do
    validates :image
    validates :product_name
    validates :explanation
    validates :category_i 
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
