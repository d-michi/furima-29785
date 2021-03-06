require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  before do
    @item_address = FactoryBot.build(:item_address)
  end

  describe '購入機能' do
    context '商品購入がうまくいくとき' do
      it 'token, user_id, item_id, postal_code, prefecture_id, city, addresses, phone_number, order_idがあれば保存ができること' do
        expect(@item_address).to be_valid
      end
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'tokenが空では保存ができないこと' do
      @item_address.token = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('クレジットカード情報を入力してください')
    end
    it 'postal_codeが空では保存ができないこと' do
      @item_address.postal_code = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('郵便番号を入力してください')
    end
    it 'prefecture_idが0では保存ができないこと' do
      @item_address.prefecture_id = 0
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('都道府県を入力してください')
    end
    it 'cityが空では保存ができないこと' do
      @item_address.city = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('市区町村を入力してください')
    end
    it 'addressesが空では保存ができないこと' do
      @item_address.addresses = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('番地を入力してください')
    end
    it 'phone_numberが空では保存ができないこと' do
      @item_address.phone_number = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('電話番号を入力してください')
    end
    it 'postal_codeにハイフンがなければ保存ができないこと' do
      @item_address.postal_code = '12345678'
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('郵便番号はハイフンが必要です')
    end
    it 'phone_numberにはハイフンは不要で11桁以内でないと保存ができないこと' do
      @item_address.phone_number = '1234567891011'
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('電話番号は11桁以内です')
    end
  end
end
