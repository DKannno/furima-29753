require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
    context '購入が成功したとき' do
      it 'postal_code,prefecture_id,city,house_number,phone_number,tokenが存在すれば購入できる'do
        expect(@order_address).to be_valid
      end
    end
    context '購入が失敗したとき' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("PostalCode can’t be blank”, ‘Postal is invalid")
      end
      it 'postage_numberにハイフン（-）を含まないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("PostalCode is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can’t be blank”, ‘Prefecture Select")
      end
      it 'prefecture_idが0だと購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can’t be blank")
      end
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("HouseNumber can’t be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("PhoneNumber can’t be blank")
      end
      it 'phone_numberが11桁以上だと購入できない'do
        @order_address.phone_number = '123456789100'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("PhoneNumber は11桁ハイフンなしで入力してください。")
      end
      it 'phone_numberにハイフン（-）が含まれると購入できない' do
        @order_address.phone_number = '123-4567-891'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("PhoneNumber は11桁ハイフンなしで入力してください。")
      end
      it 'tokenがないと購入が出来ない'do
        @order_address.token = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can’t be blank")
      end
    end
  end
end
