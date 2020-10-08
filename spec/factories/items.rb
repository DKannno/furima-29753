FactoryBot.define do
  factory :item do
    association :user

    name                { 'かっぱのおまもり'}
    description         { 'これはすごいうるおい！皆に幸あれ！'}
    category_id         {2}
    condition_id        {2}
    postage_id          {2}
    prefecture_id       {2}
    handling_time_id    {2}
    price               {99999}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
