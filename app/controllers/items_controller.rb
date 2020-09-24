class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    # モデルの定義をしましょう Pictweetのnewを参照に
    @item = Item.new
    @prefectre = Prefecture.all
    @category = ItemCategory.all
    @sales_status = ItemSalesStatus.all
    @scheduled_delivery = ItemScheduledDelivery.all
    @shipping_fee_status = ItemShippingFeeStatus.all
  end

  def edit
  end

  def show
  end
end
