class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # 新規登録後マイページに遷移させるためのコード（マイページ実装後コメントアウトを削除）
  # def after_sign_in_path_for(resource)
  #   # user_path
  # end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :encrypted_password])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :encrypted_password, :family_name, :name, :family_name_kana, :name_kana,:prefecture, :city, :street, :building, :image, :introduction, :postal_code, :phone, :birth_year, :birth_month, :birth_day])
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