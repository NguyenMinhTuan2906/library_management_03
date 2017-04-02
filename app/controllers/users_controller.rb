class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :load_user, except: [:new, :index, :create]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.select(:id, :name, :email)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def show
    @book_borrows = @user.book_borrows
  end

  def new
    @user = User.new
  end

  def edit
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

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :edit
    end
  end

  def following
    @title = t "following"
    @user  = User.find_by id: params[:id]
    @users = @user.following.paginate page: params[:page],
      per_page: Settings.paginate.per_page
    render :show_follow
  end

  def followers
    @title = t "followers"
    @user  = User.find_by id: params[:id]
    @users = @user.followers.paginate page: params[:page],
      per_page: Settings.paginate.per_page
    render :show_follow
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
