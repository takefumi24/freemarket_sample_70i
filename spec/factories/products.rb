FactoryBot.define do
  factory :product do
    id { "1" }
    name { "ドラえもん" }
    detail { "ドラえもんです。" }
    shipping_date { "0" }
    price { "30000" }
    which_postage { "0" }
    delivery_status { "出品中" }
    prefecture { "14" }
    brand_id { "2" }
    user_id { "1" }
    size_id { "2" }
    condition_id { "3" }
    sending_method_id { "2" }
    category_id { "402" }
  end
end