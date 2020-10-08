require 'rails_helper'

RSpec.describe Item, type: :model do
  before  do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name,description,cotegory_id,postage_id,prefecture_id,handling_time_id,price,userが存在すれば商品出品できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it'descriptionが空だと出品できない' do
        @item.description =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it'category_idが空だと出品できない' do
        @item.category_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it'category_idが1では出品できない' do
        @item.category_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it'condition_idが空だと出品できない' do
        @item.condition_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it'condition_idが1では出品できない' do
        @item.condition_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it'postage_idが空だと出品できない' do
        @item.postage_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is not a number")
      end
      it'postage_idが1では出品できない' do
        @item.postage_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it'prefecture_idが空だと出品できない' do
        @item.prefecture_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it'prefecture_idが1では出品できない' do
        @item.prefecture_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it'handling_time_idが空だと出品できない' do
        @item.handling_time_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time can't be blank")
      end
      it'handling_time_idが1では出品できない' do
        @item.handling_time_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time must be other than 1")
      end
      it'priceが空だと出品できない' do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it'priceが半角数字以外だと出品できない' do
        @item.price ='９６３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it'priceが300円以下だと出品できない' do
        @item.price ='33'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it'priceが9999999円以上だと出品できない' do
        @item.price ='99999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
