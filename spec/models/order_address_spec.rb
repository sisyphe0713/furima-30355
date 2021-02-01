require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '郵便番号post_codeが空だと保存できないこと' do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号post_codeにハイフンが含まれていないと保存できないこと' do
      @order_address.post_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Inclue hyphen(-)")
    end
    it '都道府県prefecture_idが空だと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県prefecture_idが1だと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地address_numberが空だと保存できないこと' do
      @order_address.address_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address number can't be blank")
    end
    it '電話番号telephoneが空だと保存できないこと' do
      @order_address.telephone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it '電話番号telephoneがハイフンを含むと保存できないこと' do
      @order_address.telephone = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone must be less than 11 degit without hyphen(-)")
    end
    it '電話番号telephoneが11桁以内でないと保存できないこと' do
      @order_address.telephone = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone must be less than 11 degit without hyphen(-)")
    end
    it 'buildingは空でも保存できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
