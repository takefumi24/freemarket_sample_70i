FactoryBot.define do

  factory :sale do
    name              {"商品名"}
    detail            {"詳細"}
    condition_id      {"1"}
    delivery_payer_id {"1"}
    prefecture_id     {"1"}
    prep_days_id      {"1"}
    price             {"1000"}
    status            {"0"}
    seller_id         {"1"}
  end
end
