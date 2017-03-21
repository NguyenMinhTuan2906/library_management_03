class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :is_admin?
  layout "admin"

  def index
    @users = User.select(:id, :name, :email)
    .order_name.paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end
end
