require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入機能' do
    context '商品購入がうまくいくとき' do
      it 'token, postal_code, prefecture_id,city, addresses, phone_numberがあれば保存ができること' do
        expect(@order).to be_valid
      end
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'postal_codeが空では保存ができないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('郵便番号を入力してください')
    end
  end
end
