require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '購入情報が保存される場合' do
      it 'すべての情報があれば保存できる' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '購入情報が保存されない場合' do
      it 'post_codeが空では保存できない' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは3桁ハイフン4桁の半角文字列でないと保存できない' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが1では保存できない' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_shipping.phone_number = '00000000'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが半角数字以外では保存できない' do
        @order_shipping.phone_number = '００００００００００'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only half-width number')
      end
      it 'userが紐づいていないと保存できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
