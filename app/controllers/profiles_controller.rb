class ProfilesController < ApplicationController
  def create
    Profile.create(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:family_name, :name, :family_name_kana, :name_kana, :city, :street, :building, :image, :introduction, :postal_code, :phone, :birth_year, :birth_month, :birth_day, :prefecture)
  end
end

