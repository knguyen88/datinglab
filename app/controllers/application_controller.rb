class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    if !signed_in?
      flash[:error] = 'You must sign in to see this page'
      redirect_to login_path
    end
  end

  def skip_if_logged_in
    if signed_in?
      redirect_to users_path
    end
  end
end
