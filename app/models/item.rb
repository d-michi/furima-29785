class Item < ApplicationRecord
 has_one :order
 belongs_to :user

 validates :image,                         presence: true
 validates :item_name,                     presence: true
 validates :item_explain,                  presence: true
 validates :price,                         presence: true
 validates :prefecture_id,                 presence: true
 validates :item_category_id,              presence: true
 validates :item_sales_status_id,          presence: true
 validates :item_shipping_fee_status_id,   presence: true
 validates :item_scheduled_delivery_id,    presence: true

 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :prefecture
 belongs_to_active_hash :item_category
 belongs_to_active_hash :item_sales_status
 belongs_to_active_hash :item_shipping_fee_status
 belongs_to_active_hash :item_scheduled_delivery
 has_one_attached :image

 with_options numericality: { other_than: 0 } do
  validates :prefecture_id, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_scheduled_delivery_id
 end
 validates :price, numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
end
