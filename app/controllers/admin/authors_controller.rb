class Admin::AuthorsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_author, only: [:edit, :update, :show]
  layout "admin"

  def index
    @authors = Author.select(:id, :name)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t ".author"
      redirect_to admin_authors_url
    else
      render :new
    end
  end

  def update
    if @author.update_attributes author_params
      flash[:success] = t ".success"
      redirect_to admin_author_url
    else
      render :edit
    end
  end

  private

  def author_params
    params.require(:author).permit :name, :description
  end

  def load_author
    @author = Author.find_by id: params[:id]
    unless @author
      flash[:danger] = t ".none"
      redirect_to admin_authors_url
    end
  end
end
