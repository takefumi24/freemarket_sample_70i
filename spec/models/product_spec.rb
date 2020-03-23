require 'rails_helper'

# RSpec.feature "購入テスト",type: :feature do
#   scenario "購入画面まで遷移できる" do
#     @user = FactoryBot.create(:user)
#     @product = FactoryBot.create(:product, user_id: @user.id)
#     @card = FactoryBot.create(:credit_card, user_id: @user.id)
#     # トップページへアクセス
#     visit root_path
#     # サインインページへ遷移
#     click_link "ログイン"
#     # メアドとパスワードを入力してログイン
#     fill_in "user[email]", with: @user.email
#     fill_in "user[password]", with: @user.password
#     click_on "ログイン"
#     visit product_path(@product)
#     visit buy_product_path(@product)
#   end
#   scenario "購入後、delivery_statusが取引中になる" do
#     visit done_product_purchase_path(product_id: @product.id)
#     expect(product[:delivery_status]).to "取引中"
#   end
# end


# 出品機能バリデーションテスト
describe Product do
  describe '#create' do

    context "出品できない場合" do

      it "商品名が無い場合出品できない" do
        product = FactoryBot.build(:product_new, name: "")
        product.valid?
        expect(product.errors[:name]).to include("を入力してください")
      end
      
      it "商品名が41文字以上の場合出品できない" do
        name = Faker::Lorem.characters(number: 41)
        product = FactoryBot.build(:product_new, name: name)
        product.valid?
        expect(product.errors[:name]).to include("は40文字以内で入力してください")
      end

      it "商品説明が無い場合出品できない" do
        product = FactoryBot.build(:product_new, detail: "")
        product.valid?
        expect(product.errors[:detail]).to include("を入力してください")
      end

      it "商品説明が1001文字以上の場合出品できない" do
        detail = Faker::Lorem.characters(number: 1001)
        product = FactoryBot.build(:product_new, detail: detail)
        product.valid?
        expect(product.errors[:detail]).to include("は1000文字以内で入力してください")
      end

      it "カテゴリーがない場合出品できない" do
        product = FactoryBot.build(:product_new, category_id: "")
        product.valid?
        expect(product.errors[:category_id]).to include("を入力してください")
      end

      it "サイズがない場合出品できない" do
        product = FactoryBot.build(:product_new_no_size)
        product.valid?
        expect(product.errors[:size]).to include("を入力してください")
      end

      it "商品の状態がない場合出品できない" do
        product = FactoryBot.build(:product_new_no_condition)
        product.valid?
        expect(product.errors[:condition]).to include("を入力してください")
      end

      it "配送料負担の指定が無い場合出品できない" do
        product = FactoryBot.build(:product_new, which_postage: "")
        product.valid?
        expect(product.errors[:which_postage]).to include("を入力してください")
      end

      it "配送方法の指定が無い場合出品できない" do
        product = FactoryBot.build(:product_new_no_sending_method)
        product.valid?
        expect(product.errors[:sending_method]).to include("を入力してください")
      end
      
      it "配送元地域の選択が無い場合出品できない" do
        product = FactoryBot.build(:product_new, prefecture: "")
        product.valid?
        expect(product.errors[:prefecture]).to include("を入力してください")
      end
      
      it "発送までの日数が無い場合出品できない" do
        product = FactoryBot.build(:product_new, shipping_date: "")
        product.valid?
        expect(product.errors[:shipping_date]).to include("を入力してください")
      end
      
      it "価格の入力が無い場合入力できない" do
        product = FactoryBot.build(:product_new, price: "")
        product.valid?
        expect(product.errors[:price]).to include("を入力してください")
      end

      it "画像が無い場合出品できない" do
        product_no_image = FactoryBot.build(:product_new_no_image)
        product_no_image.valid?
        expect(product_no_image.errors[:images]).to include("を入力してください")
      end
      
      it "画像が11枚以上の場合出品できない" do
        product_over_images = FactoryBot.build(:product_new_over_images)
        product_over_images.valid?
        expect(product_over_images.errors[:images]).to include("は10文字以内で入力してください")
      end
      
    end
    
    context "出品できる場合" do
      
      it "商品名が40文字以下の場合出品できる" do
        name = Faker::Lorem.characters(number: 40)
        product = FactoryBot.build(:product_new, name: name)
        expect(product).to be_valid
      end
      
      it "商品説明が1000文字以下の場合出品できる" do
        detail = Faker::Lorem.characters(number: 1000)
        product = FactoryBot.build(:product_new, detail: detail)
        expect(product).to be_valid
      end
      
      it "画像が10枚以内なら出品できる" do
        product_just_images = FactoryBot.build(:product_new_just_images)
        expect(product_just_images).to be_valid
      end
      
      it "全ての必須項目が入力されている場合出品できる" do
        product = FactoryBot.build(:product_new)
        expect(product).to be_valid
      end
      
    end

  end
end

