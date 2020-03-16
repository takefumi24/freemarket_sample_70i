require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a nickname" do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without an email" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "を入力してください")
    end

    # it "cannot sign up with mismatched password and confirmation" do
    #   user = FactoryBot.build(:user, password_confirmation: "00000000")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("Password confirmationとPasswordの入力が一致しません")
    # end

    it "is match password" do
      user = FactoryBot.build(:user, email: "test@test.com", password: "hogehoge", password_confirmation: "hogehoge")
      user.valid?
      expect(user.errors[:password_confirmation]).not_to be_present
    end

    it "is not match password" do
      user = FactoryBot.build(:user, email: "test@test.com", password: "hogehoge", password_confirmation: "fugafuga")
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

  end
end