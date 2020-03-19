require 'rails_helper'

describe Product do
  describe '#create' do

    context "出品できない場合" do
      it "画像が無い場合、保存されない" do
        image = FactoryBot.build(:image, image: "")
        image.valid?
        expect(image.errors[:image]).to include("を入力してください")
      end
    end

    context "出品できる場合" do
      it "画像がある場合、保存される" do
        image = FactoryBot.build(:image)
        expect(image).to be_valid
      end

    end
  end
end