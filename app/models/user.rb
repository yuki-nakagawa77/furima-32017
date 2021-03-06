class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders_historys

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  with_options presence: true do
    validates :nickname 
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_hurigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
