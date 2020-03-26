class Users::RegistrationsController < Devise::RegistrationsController

  # deviseの不具合で、バリデーションが効いていても登録完了画面に遷移してしまうため、
  # 別途controllerを作り、下記createアクションで対応しています。
  def create
    resource = User.new(user_params)
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      @user = resource
      render :new 
    end
  end

  protected

  def user_params
    params.require(:user).permit(:nickname, :password, :password_confirmation, :email, :family_name, :name, :family_name_kana, :name_kana, :destination_family_name, :destination_name, :destination_family_name_kana, :destination_name_kana, :prefecture, :city, :street, :building, :postal_code, :phone, :birth_year, :birth_month, :birth_day)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
