require 'rails_helper'

RSpec.feature "購入テスト",type: :feature do
  scenario "購入画面まで遷移できる" do
    @user = FactoryBot.build(:user)
    @product = FactoryBot.build(:product)
    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "ログイン"
    visit product_path(@product[:id])
    # visit buy_product_path(@product.id)
    # click_on '購入する'
    # expect(product[:delivery_status]).to "取引中"
  end
end