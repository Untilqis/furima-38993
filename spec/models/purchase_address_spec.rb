require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '商品を購入できる時' do
      it 'すべての情報が存在している場合に登録できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingは空白でも登録できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品を購入できない時' do
      it 'postal_codeが空の時には登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに-が入っていない場合には登録できない' do
        @purchase_address.postal_code = '11111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeが半角数字ではない場合には登録できない' do
        @purchase_address.postal_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが選択されていない時、または[---]を選択した際には登録できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空の時には登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空の時には登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空の時には登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10文字以下の場合は登録できない' do
        @purchase_address.phone_number = '0901234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12文字以上の場合は登録できない' do
        @purchase_address.phone_number = '0901234567899'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいていないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'userとitemが紐づいていないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank", "Item can't be blank")
      end
    end
  end
end
