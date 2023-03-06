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
      flash.now[:error] = "Please correct the errors below"
      render 'new'

    end

  end

  def all_users
    @user = User.all
    @following_users = current_user.following_users
    # @is_following = current_user.following?(set_user)
    # @has_sent_request = current_user.sent_follow_request_to?(set_user)
    # @has_received_request = current_user.received_follow_request_from?(set_user)

  end

  # this is for the follow unfollow
  def show
  end

  def follow
    current_user.send_follow_request_to(set_user)
    flash[:success] = "Follow request sent to #{set_user.username}"
    redirect_to profile_path(set_user)
  end

  #unfollow
  def unfollow
    make_it_a_unfriend_request

    current_user.unfollow(set_user)
    flash[:success] = "You have unfollow the user #{set_user.username}"
    redirect_to messages_path(set_user)
  end

  def accept
    current_user.accept_follow_request_of(set_user)
    make_it_a_friend_request
    flash[:success] = "You have accept the request from the user #{set_user.username}"
    redirect_to messages_path
  end

  def decline
    current_user.decline_follow_request_of(set_user)
    flash[:error] = "You have dicline the request from the user #{set_user.username}"
    redirect_to root_path
  end

  def cancel
    current_user.remove_follow_request_for(set_user)
    flash[:success] = "You have cancel the request from the user #{set_user.username}"
    redirect_to root_path
  end

  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(set_user)
    set_user.accept_follow_request_of(current_user)
  end

  def make_it_a_unfriend_request
    set_user.unfollow(current_user) if set_user.mutual_following_with?(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def redirect_signed_in_user
    if current_user
      redirect_to root_path, alert: "You are already signed in."
    end
  end


end