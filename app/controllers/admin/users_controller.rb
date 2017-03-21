class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_user, only: :destroy
  layout "admin"

  def index
    @users = User.select(:id, :name, :email)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end