class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    # 新規登録のストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :nickname, :password, :password_confirmation, :email, :family_name, :name, :family_name_kana, :name_kana,:prefecture, :city, :street, :building, :postal_code, :phone, :birth_year, :birth_month, :birth_day])
    # 会員情報変更のストロングパラメータ
    devise_parameter_sanitizer.permit(:account_update, keys: [:id, :nickname, :email, :family_name, :name, :family_name_kana, :name_kana,:prefecture, :city, :street, :building, :postal_code])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end