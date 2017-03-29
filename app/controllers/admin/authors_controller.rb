class Admin::AuthorsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  layout "admin"

  def index
    @authors = Author.select(:id, :name)
      .order(name: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def new
    @author = Author.new
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

  private

  def author_params
    params.require(:author).permit :name, :description
  end
end
