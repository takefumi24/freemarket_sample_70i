class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]

  def new
    binding.pry
    @user = User.new
    @user = User.create(user_params)
  end

  # def create
  #   @user = User.new(user_params)
  #   unless @user.valid?
  #     flash.now[:alert] = @user.errors.full_messages
  #     render :new and return
  #   end
  #   # session["devise.regist_data"] = {user: @user.attributes}
  #   # session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   @profile = @user.build_profile
  #   render :new_profile
  # end

  def create
    binding.pry
    @user = User.create(user_params)
  end
  
  # def create_profile
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @profile = Profile.new(profile_params)
  #   unless @profile.valid?
  #     flash.now[:alert] = @profile.errors.full_messages
  #     render :new_profile and return
  #   end
  #   @user.build_profile(@profile.attributes)
  #   @user.save
  #   sign_in(:user, @user)
  end

  protected

  def user_params
    params.require(:user).permit(:nickname)
  end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

end
