class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_category, except: [:new, :index, :create]
  layout "admin"

  def index
    if params[:q].present?
      @categories = Category.select(:id, :name).search(params[:q])
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    else
      @categories = Category.select(:id, :name)
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    end
  end

  def show
    @books = Book.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".category"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    if @category.books.any?
       flash[:danger] = t ".delete_fail"
    else
      if @category.destroy
        flash[:success] = t ".delete"
      else
        flash[:danger] = t ".delete_fail"
      end
    end
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t ".none"
      redirect_to admin_categories_url
    end
  end
end
