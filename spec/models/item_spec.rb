require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品画像を1枚つけないと出品できない" do
        @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名を書かないと出品できない" do
        @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品の説明を書かないと出品できない" do
        @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報を選択しないと出品できない" do
        @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報を選択しないと出品できない" do
        @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報を選択しないと出品できない" do
        @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it "発送元の地域についての情報を選択しないと出品できない" do      
        @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数についての情報を選択しないと出品できない" do
        @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "価格についての情報を入力しないと出品できない" do
        @item.price = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でないと出品できない(¥300以下)" do
        @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
        it "価格の範囲が、¥300~¥9,999,999の間でないと出品できない(¥9,999,999以上)" do
        @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格は半角数字でないと出品できない" do
        @item.price = 'ふりがな'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
