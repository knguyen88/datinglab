class UsersController < ApplicationController
  before_action :require_login, only: [:index]
  before_action :skip_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.create(user_params)
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
