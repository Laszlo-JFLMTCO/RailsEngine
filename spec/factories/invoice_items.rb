FactoryGirl.define do
  factory :invoice_item do
    invoice 
    item
    quantity 1
    unit_price 1
    created_at "2017-01-24 00:10:51"
    updated_at "2017-01-24 00:10:51"
  end
end
