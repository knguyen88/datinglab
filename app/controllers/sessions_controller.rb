class SessionsController < ApplicationController
  before_action :skip_if_logged_in, only: [:show_login_form]

  def show_login_form
    @user = User.new
    render 'login'
  end

  def do_login
    @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Hi'
      redirect_to users_path
    else
      flash[:error] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = 'Bye bye bye'
    redirect_to root_path
  end
end