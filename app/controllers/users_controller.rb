class UsersController < ApplicationController
  before_action :redirect_signed_in_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created"
    else
      render 'new'
    end

  end

  def all_users
    @user = User.all
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def redirect_signed_in_user
    if current_user
      redirect_to root_path, alert: "You are already signed in."
    end
  end




end