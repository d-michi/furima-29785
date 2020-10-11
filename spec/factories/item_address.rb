FactoryBot.define do
  factory :item_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {"3"}
    city {"名古屋市"}
    addresses {"中村区1-1-1"}
    phone_number {"09011112222"}
  end
end