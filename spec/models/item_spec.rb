require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'item_nameとtext、state_id、burden_id、locality_id、delivery_id、category＿id、priceがあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'burden_idが空では登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it 'locality_idが空では登録できない' do
        @item.locality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Locality can't be blank")
      end

      it 'delivery_idが空では登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idに1が選択されている場合は登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it 'burden_idに1が選択されている場合は登録できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it 'locality_idに1が選択されている場合は登録できない' do
        @item.locality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Locality must be other than 1")
      end

      it 'delivery_idに1が選択されている場合は登録できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it 'category_idに1が選択されている場合は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品価格が半角英数字混合では出品できない' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '商品価格が全角文字では出品できない' do
        @item.price = 'AAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '商品価格が299円以下では出品できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '商品価格が10_000_000円以上は出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
