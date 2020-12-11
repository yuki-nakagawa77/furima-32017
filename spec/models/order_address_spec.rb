require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user, email: 'test2@example')
    item = FactoryBot.create(:item, user_id: seller.id)
    @order = FactoryBot.build(:order_address, user_id: buyer.id, item_id: item.id)
    sleep 0.2
  end

  describe '商品購入機能' do
    context '商品購入が上手くいくとき' do
      it "必要な情報を適切に入力すると、商品の購入ができること" do
        expect(@order).to be_valid
      end
      it "建物名がなくても購入できること" do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入が上手くいかないとき' do
      it "クレジットカード情報は必須であること " do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "配送先の情報として、郵便番号を入力しないと購入できない" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "配送先の情報として、都道府県を選択しないと購入できない" do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
      end
      it "配送先の情報として、市区町村を入力しないと購入できない" do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "配送先の情報として、番地を入力しないと購入できない" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "配送先の情報として、電話番号を入力しないと購入できない" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "郵便番号にはハイフンがないと購入できない" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号にはハイフンは不要で、11桁以上なら購入できない" do
        @order.phone_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号にはハイフンあると購入できない" do
        @order.phone_number = '-'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end