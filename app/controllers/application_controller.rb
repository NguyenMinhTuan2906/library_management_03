class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def is_admin?
    unless current_user.is_admin
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".log_in"
      redirect_to login_url
    end
  end
end
