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
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'postal_codeに-が入っていない場合には登録できない' do
        @purchase_address.postal_code = '11111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'postal_codeが半角数字ではない場合には登録できない' do
        @purchase_address.postal_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it 'prefecture_idが空の時には登録できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'prefecture_idが---の時には登録できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it 'cityが空の時には登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'house_numberが空の時には登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空の時には登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが10文字以下の場合は登録できない' do
        @purchase_address.phone_number = '0901234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが12文字以上の場合は登録できない' do
        @purchase_address.phone_number = '0901234567899'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it 'userが紐づいていないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("ユーザー情報を入力してください")
      end

      it 'itemが紐づいていないと登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("商品情報を入力してください")
      end

      it 'userとitemが紐づいていないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("ユーザー情報を入力してください", "商品情報を入力してください")
      end
    end
  end
end
