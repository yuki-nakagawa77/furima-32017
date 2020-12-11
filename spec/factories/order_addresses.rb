FactoryBot.define do
  factory :order_address do
    postal_code    {'123-4567'}
    area_id        { 2 }
    municipalities {"横浜市緑町"}
    address        {"青山1-1-1"}
    phone_number   {"09012345678"}
    token          {"token"}
    association :user
    association :item
  end
end