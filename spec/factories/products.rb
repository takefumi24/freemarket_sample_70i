FactoryBot.define do
  # factory :product do
  #   # id { "1" }
  #   name { "ドラえもん" }
  #   detail { "ドラえもんです。" }
  #   shipping_date { "0" }
  #   price { "30000" }
  #   which_postage { "0" }
  #   delivery_status { "出品中" }
  #   prefecture { "1" }
  #   brand_id { "1" }
  #   # user_id { "1" }
  #   size_id { 1 }
  #   condition_id { 1 }
  #   sending_method_id { 1 }
  #   category_id { 1 }
  # end


  
  # 出品機能用
  
  factory :product_new, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    condition
    sending_method
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end

  factory :product_new_no_size, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    condition
    sending_method
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end

  factory :product_new_no_condition, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    sending_method
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end

  factory :product_new_no_sending_method, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    condition
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end
  
  factory :product_new_no_image, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    condition
    sending_method
    user
  end

  factory :product_new_just_images, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    condition
    sending_method
    user
    after(:build) do |product|
      product.images << build_list(:image, 10, product: product)
    end
  end

  factory :product_new_over_images, class: Product do
    id                {"1"}
    name              {"商品名"}
    detail            {"詳細"}
    category_id       {"686"}
    which_postage     {"1"}
    prefecture        {"1"}
    shipping_date     {"1"}
    price             {"1000"}
    size
    condition
    sending_method
    user
    after(:build) do |product|
      product.images << build_list(:image, 11, product: product)
    end
  end
end
