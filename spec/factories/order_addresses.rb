FactoryBot.define do
  factory :order_address do
    postal_code      { '988-0099' }
    prefecture_id    { 2 }
    city             { '仙台' }
    house_number     { '青葉' }
    building_name    { '花京院ビル' }
    telephone        { 12345678912 }
    token            { 'tok_hogehoge1234' }
    association      :item
    association      :user
  end
end
