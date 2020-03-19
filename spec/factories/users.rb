FactoryBot.define do
  factory :user do
    nickname              {"テスト"}
    email                 {"test@test"}
    password              {"aaaaaaa"}
    password_confirmation {"aaaaaaa"}
    family_name           {"テスト"}
    name                  {"テスト"}
    family_name_kana      {"テスト"}
    name_kana             {"テスト"}
    prefecture            {"14"}
    city                  {"テスト"}
    street                {"テスト"}
    postal_code           {"1111111"}
    phone                 {"09000000000"}
    birth_year            {"1991"}
    birth_month           {"4"}
    birth_day             {"5"}
  end
end