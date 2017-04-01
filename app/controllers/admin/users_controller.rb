class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_user, only: [:destroy, :show]
  layout "admin"

  def index
    if params[:q].present?
      @users = User.select(:id, :name, :email).search(params[:q])
        .order(id: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    else
      @users = User.select(:id, :name, :email)
        .order(id: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    end
  end

  def show
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
