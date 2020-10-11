class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_address = ItemAddress.new(order_params)
    if @item_address.valid?
      pay_item
      @item_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_address).permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
