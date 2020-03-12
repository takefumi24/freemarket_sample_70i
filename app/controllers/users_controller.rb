class UsersController < ApplicationController
  
  def show
  end

  def new
  end

  def create
    redirect_to user_registration_path
  end
  
end
