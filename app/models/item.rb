class Item < ApplicationRecord
 has_one :order
 belongs_to :user

 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :prefecture
 belongs_to_active_hash :item_category
 belongs_to_active_hash :item_sales_status
 belongs_to_active_hash :item_shipping_fee_status
 belongs_to_active_hash :item_scheduled_delivery
 has_one_attached :image

 validates :image, :item_name, :item_explain, :price, :prefecture_id, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_scheduled_delivery_id, presence: true

 with_options numericality: { other_than: 0 } do
  validates :prefecture_id, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_scheduled_delivery_id
 end
end
