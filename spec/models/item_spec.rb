require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '商品が出品できる時' do
      it 'image、name、description、category_id、condition_id、shipping_cost_id、prefecture_id、shipping_date_id、pricem、user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it '商品のカテゴリーが選択されてなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '商品の状態が選択されてなければ登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '配送料の負担が選択されてなければ登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '発送元の地域が選択されてなければ登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送までの日数が選択されてなければ登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格を入力してください")
      end

      it '価格が半角数字以外では登録ができない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の価格は数値で入力してください')
      end

      it '価格が整数以外では登録ができない' do
        @item.price = '3939.39'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の価格は整数で入力してください')
      end

      it '価格が300円以下では登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の価格は300以上の値にしてください')
      end

      it '価格が9,999,999円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の価格は9999999以下の値にしてください')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザー情報を入力してください')
      end
    end
  end
end
