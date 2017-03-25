class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :load_user, except: [:new, :index, :create]

  def index
    @users = User.select(:id, :name, :email).order_name.paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".welcome_user"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t ".none"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
