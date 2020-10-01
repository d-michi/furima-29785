class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @prefectre = Prefecture.all
    @category = ItemCategory.all
    @sales_status = ItemSalesStatus.all
    @scheduled_delivery = ItemScheduledDelivery.all
    @shipping_fee_status = ItemShippingFeeStatus.all
  end

  def create
    @item = Item.new(item_params)
    @prefectre = Prefecture.all
    @category = ItemCategory.all
    @sales_status = ItemSalesStatus.all
    @scheduled_delivery = ItemScheduledDelivery.all
    @shipping_fee_status = ItemShippingFeeStatus.all

    if @item.save
      redirect_to items_path
    else
      render action: 'new.html.erb'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explain, :price, :prefecture_id, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end
end

def edit
end

def update
end

def show
end
