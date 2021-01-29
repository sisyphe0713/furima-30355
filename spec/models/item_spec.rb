require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録ができる時' do
      it "全ての値が正しければ登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名がないと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明がないと登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーの情報がないと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態についての情報がないと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "配送料の負担についての情報がないと登録できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it "配送元の地域の情報がないと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数についての情報がないと登録できない" do
        @item.ship_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it "価格についての情報がないと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格の範囲が¥300以上でないと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格の範囲が¥9,999,999以下でないと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "販売価格が半角数字でないと登録できない" do
        @item.price = "百"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角英数混合だと登録できない" do
        @item.price = "3 handred"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角英語だと登録できない" do
        @item.price = "three handred"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end


      it "カテゴリーが1( '--')以外でないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態が1( '--')以外でないと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料の負担が1( '--')以外でないと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it "配送元の地域が1( '--')以外でないとと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数が1( '--')以外でないと登録できない" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day must be other than 1")
      end
    end
  end
end
