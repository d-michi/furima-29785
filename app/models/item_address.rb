class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :addresses, :token
    validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンが必要です' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は11桁以内です' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
