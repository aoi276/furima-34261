require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '商品購入が出来るとき' do
      it 'postal_code、locality_id、municipality、street、phoneがあれば登録できる' do
        expect(@buyer_address).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      
      it 'postal_codeが空では登録できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンを含んだ正しい形式でないと登録できない' do
        @buyer_address.postal_code = 000-0000
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'locality_idが空では登録できない' do
        @buyer_address.locality_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Locality can't be blank")
      end

      it 'locality_idが1では登録できない' do
        @buyer_address.locality_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Locality must be other than 1")
      end
    
      it 'municipalityが空では登録できない' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end
    
      it 'streetが空では登録できない' do
        @buyer_address.street = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phoneが空では登録ができない' do
        @buyer_address.phone = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが11桁以内の数値でない場合登録できない' do
        @buyer_address.phone = "aaaaaaaaaaa"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone is invalid")
      end
    
      it 'userが紐づいていないと登録できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
    
      it 'itemが紐づいていないと登録できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
