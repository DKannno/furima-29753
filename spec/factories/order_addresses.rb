FactoryBot.define do
  factory :order_address do
    postal_code      { '988-0099' }
    prefecture_id    { 2 }
    city             { '仙台' }
    house_number     { '花京院' }
    phone_number        { '09066663333' }
    token            { 'tok_hogehoge1234' }
  end
end
