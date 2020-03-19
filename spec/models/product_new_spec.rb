require 'rails_helper'
describe Product do
  describe '#create' do

    before do
      @user = FactoryBot.build(:user)
    end

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
        product = FactoryBot.build(:product_new, size_id: "")
        product.valid?
        expect(product.errors[:size_id]).to include("を入力してください")
      end

      it "商品の状態がない場合出品できない" do
        product = FactoryBot.build(:product_new, condition_id: "")
        product.valid?
        expect(product.errors[:condition_id]).to include("を入力してください")
      end

      it "配送料負担の指定が無い場合出品できない" do
        product = FactoryBot.build(:product_new, which_postage: "")
        product.valid?
        expect(product.errors[:which_postage]).to include("を入力してください")
      end

      it "配送方法の指定が無い場合出品できない" do
        product = FactoryBot.build(:product_new, sending_method_id: "")
        product.valid?
        expect(product.errors[:sending_method_id]).to include("を入力してください")
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
        expect(product_no_image.errors[:images]).to include("は1文字以上で入力してください")
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