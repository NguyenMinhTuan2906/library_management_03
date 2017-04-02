class Admin::BooksController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_author_publisher_category,
    except: [:show, :destroy, :index]
  before_action :load_book, except: [:index, :new, :create]
  layout "admin"

  def index
    @books = Book.includes(:publisher, :author, :category)
      .select(:id, :name, :author_id, :publisher_id, :category_id)
      .order(id: :asc).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
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

  def update
    if @book.update_attributes book_params
      flash[:success] = t ".success"
      redirect_to admin_books_url
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to admin_books_url
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
