class Admin::BooksController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_author_publisher_category, only: [:new, :create]
  layout "admin"

  def index
    @books = Book.includes(:publisher, :author, :category)
      .select(:id, :name, :author_id, :publisher_id, :category_id)
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
      :paperback, :publisher_id, :category_id
  end

  def load_author_publisher_category
    @author = Author.all.map{|c| [c.name, c.id]}
    @publisher = Publisher.all.map{|a| [a.name, a.id]}
    @category = Category.all.map{|b| [b.name, b.id]}
  end
end
