require 'rails_helper'

RSpec.feature "購入テスト",type: :feature do
  scenario "購入画面まで遷移できる" do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product, user_id: @user.id)
    # @card = FactoryBot.create(:credit_card, user_id: @user.id)
    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_on "ログイン"
    visit product_path(@product)
    visit buy_product_path(@product)
  end
  # scenario "購入後、delivery_statusが取引中になる" do
  #   visit done_product_purchase_path(product_id: @product.id)
  #   expect(product[:delivery_status]).to "取引中"
  # end
end

