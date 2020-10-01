require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品登録がうまくいくとき' do
      it 'image, item_name, item_explain,price, prefecture_id, item_category_id, item_sales_status_id, item_shipping_fee_status_id, item_scheduled_delivery_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品登録がうまくいかないとき' do
    it 'item_nameが空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it 'item_explainが空では登録できない' do
      @item.item_explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'item_category_idが空では登録できない' do
      @item.item_category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
    end
    it 'item_category_idが0では登録できない' do
      @item.item_category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
    end
    it 'item_sales_status_idが空では登録できない' do
      @item.item_sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を入力してください')
    end
    it 'item_sales_status_idが0では登録できない' do
      @item.item_sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を入力してください')
    end
    it 'item_shipping_fee_status_idが空では登録できない' do
      @item.item_shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
    end
    it 'item_shipping_fee_status_idが0では登録できない' do
      @item.item_shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
    end
    it 'prefecture_idが0では登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
    end
    it 'item_scheduled_delivery_idが空では登録できない' do
      @item.item_scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
    end
    it 'item_scheduled_delivery_idが0では登録できない' do
      @item.item_scheduled_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を入力してください')
    end
    it 'priceが¥300~¥9,999,999の間でないと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it 'priceが¥300~¥9,999,999の間でないと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it 'priceは半角数字でないと登録できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end
  end
end
