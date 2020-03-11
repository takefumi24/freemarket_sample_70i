class Users::RegistrationsController < Devise::RegistrationsController
  def create
    check = true

    session[:nickname]              = params[:session][:nickname]
    session[:email]                 = params[:session][:email]
    session[:password]              = params[:session][:password]
    session[:encrypted_password]    = params[:session][:encrypted_password]

    @temporary = Temporary.create(
      nickname:              session[:nickname],
      email:                 session[:email],
      password:              session[:password],
      encrypted_password:    session[:encrypted_password],
    )

    @error = []
    @error << check_name(session[:nickname])
    @error << check_email(session[:email])
    @error = @error.compact

    check = @temporary.save(context: :new_user)

    if (check == false) || (@error.empty? == false) then
      @temporary.destroy
      render :new
    end

    session[:user_id] = @temporary.id
  end

  def profile
    session[:family_name]       = params[:session][:family_name]
    session[:name]              = params[:session][:name]
    session[:family_name_kana]  = params[:session][:family_name_kana]
    session[:name_kana]         = params[:session][:name_kana]
    session[:birth_year]        = params[:session][:birth_year]
    session[:birth_month]       = params[:session][:birth_month]
    session[:birth_day]         = params[:session][:birth_day]
    session[:introduction]      = params[:session][:introduction]
    session[:postal_code]       = params[:session][:postal_code]
    session[:prefecture]        = params[:session][:prefecture]
    session[:city]              = params[:session][:city]
    session[:street]            = params[:session][:street]
    session[:building]          = params[:session][:building]
    session[:phone]             = params[:session][:phone]

    @temporary = Temporary.find(session[:user_id])

    @temporary.update(
      family_name:        session[:family_name],
      name:               session[:name],
      family_name_kana:   session[:family_name_kana],
      name_kana:          session[:name_kana],
      birth_year:         session[:birth_year],
      birth_month:        session[:birth_month],
      birth_day:          session[:birth_day],
      postal_code:        session[:postal_code],
      prefecture:         session[:prefecture],
      city:               session[:city],
      street:             session[:street],
      building:           session[:building],
      phone_number:       session[:phone_number],
    )

    render :create unless @temporary.save(context: :profile_form)

    if (check == false) || (@error.empty? == false) then
      @temporary.phone_number = nil
      @temporary.save
      render :profile
    end
  end
end