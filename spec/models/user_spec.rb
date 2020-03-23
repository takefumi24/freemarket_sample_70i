require 'rails_helper'

describe User do
  describe '新規登録(createアクション)' do

    it "ニックネームを入力しないと登録できない" do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "emailを入力しないと登録できない" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "を入力してください")
    end

    it "パスワードが合っていれば登録できる" do
      user = FactoryBot.build(:user, email: "test@test.com", password: "hogehoge", password_confirmation: "hogehoge")
      user.valid?
      expect(user.errors[:password_confirmation]).not_to be_present
    end

    it "名字を入力しないと登録できない" do
      user = FactoryBot.build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "名前を入力しないと登録できない" do
      user = FactoryBot.build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名字（カタカナ）を入力しないと登録できない" do
      user = FactoryBot.build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "名字（カタカナ）は、カタカナでしか登録できない" do
      user = FactoryBot.build(:user, family_name_kana: "てすと")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
    
    it "名前（カタカナ）を入力しないと登録できない" do
      user = FactoryBot.build(:user, name_kana: "")
      user.valid?
      expect(user.errors[:name_kana]).to include("を入力してください")
    end

    it "名前（カタカナ）は、カタカナでしか登録できない" do
      user = FactoryBot.build(:user, name_kana: "てすと")
      user.valid?
      expect(user.errors[:name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "都道府県を選択しないと登録できない" do
      user = FactoryBot.build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください")
    end

    it "市町村を入力しないと登録できない" do
      user = FactoryBot.build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "番地を入力しないと登録できない" do
      user = FactoryBot.build(:user, street: "")
      user.valid?
      expect(user.errors[:street]).to include("を入力してください")
    end

    it "郵便番号を入力しないと登録できない" do
      user = FactoryBot.build(:user, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("を入力してください")
    end

    it "郵便番号は7桁でないと登録できない（6文字）" do
      user = FactoryBot.build(:user, postal_code: "123456")
      user.valid?
      expect(user.errors[:postal_code]).to include("は7文字以上で入力してください")
    end

    it "郵便番号は7桁でないと登録できない（8文字）" do
      user = FactoryBot.build(:user, postal_code: "12345678")
      user.valid?
      expect(user.errors[:postal_code]).to include("は7文字以内で入力してください")
    end

    it "電話番号を入力しないと登録できない" do
      user = FactoryBot.build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("を入力してください")
    end

    it "電話番号は10~11桁でないと登録できない（9文字）" do
      user = FactoryBot.build(:user, phone: "123456789")
      user.valid?
      expect(user.errors[:phone]).to include("は10文字以上で入力してください")
    end

    it "電話番号は10~11桁でないと登録できない（12文字）" do
      user = FactoryBot.build(:user, phone: "123456789012")
      user.valid?
      expect(user.errors[:phone]).to include("は11文字以内で入力してください")
    end

    it "生年月日（年）を選択しないと登録できない" do
      user = FactoryBot.build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "生年月日（月）を選択しないと登録できない" do
      user = FactoryBot.build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "生年月日（日）を選択しないと登録できない" do
      user = FactoryBot.build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

  end
end

RSpec.feature "ユーザーログイン・更新テスト",type: :feature do
  scenario "ログイン・更新 挙動確認" do
    @user = FactoryBot.create(:user)
    # トップページへアクセス
      visit root_path
    # サインインページへ遷移
      click_link "ログイン"
    # メアドとパスワードを入力してログイン
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_on "ログイン"
    #マイページへ移動（ログイン完了）
      visit user_path(@user)
    # 会員情報変更
      click_on "会員情報変更"
    # ニックネームの値を「テスト」から「ドラえもん」に変更
      fill_in "user[nickname]", with: "ドラえもん"
      click_on "修正する"
    #マイページへ移動（会員情報変更完了）
      visit user_path(@user)
    #マイページに変更後のニックネームが表示されていることを確認
      expect(page).to have_content "ドラえもん"
  end
end

