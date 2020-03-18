FactoryBot.define do
  factory :product do
    # id { "1" }
    name { "ドラえもん" }
    detail { "ドラえもんです。" }
    shipping_date { "0" }
    price { "30000" }
    which_postage { "0" }
    delivery_status { "出品中" }
    prefecture { "1" }
    brand_id { "1" }
    # user_id { "1" }
    size_id { 1 }
    condition_id { 1 }
    sending_method_id { 1 }
    category_id { 1 }
  end
end