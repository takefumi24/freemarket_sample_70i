class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def new
  end

  def index
  end
  
end

