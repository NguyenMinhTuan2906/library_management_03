class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      if current_user.is_admin?
        flash[:success] = t ".welcome"
        redirect_to admin_root_url
      else
        flash[:success] = t ".not_admin_welcome"
        redirect_to user
      end
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
