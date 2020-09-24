class Item < ApplicationRecord
 has_one :order
 belongs_to :user

 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :prefecture
 belongs_to_active_hash :item_category
 belongs_to_active_hash :item_sales_status
 belongs_to_active_hash :item_shipping_fee_status
 belongs_to_active_hash :item_scheduled_delivery

 validates :item_name, :item_explain, :price, :prefecture, :item_category, :item_sales_status, :item_shipping_fee_status, :item_scheduled_delivery, presence: true

 with_options numericality: { other_than: 0 } do
  validates :prefecture_id, :item_category, :item_sales_status, :item_shipping_fee_status, :item_scheduled_delivery
 end
end
