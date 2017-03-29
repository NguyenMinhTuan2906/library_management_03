class Admin::BooksController < ApplicationController
  before_action :logged_in_user, :verify_admin
  layout "admin"

  def index
    @books = Book.select(:id, :name, :author_id)
      .order(id: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".book"
      redirect_to admin_books_url
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit :name, :author_id, :image,
      :paperback
  end
end
