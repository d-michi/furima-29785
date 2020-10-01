FactoryBot.define do
  factory :item do
    item_name { '商品名' }
    item_explain                 { '商品説明' }
    price                        { '77777' }
    prefecture_id                { '1' }
    item_category_id             { '2' }
    item_sales_status_id         { '1' }
    item_shipping_fee_status_id  { '2' }
    item_scheduled_delivery_id   { '1' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
