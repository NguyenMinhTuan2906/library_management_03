class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def verify_admin
    unless current_user.is_admin
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t ".none"
      redirect_to root_url
    end
  end

  def load_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "books.error.book_not_found"
      redirect_to root_path
    end
  end

  def load_author
    @author = Author.find_by id: params[:id]
    unless @author
      flash[:danger] = t ".none"
      redirect_to admin_authors_url
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".log_in"
      redirect_to login_url
    end
  end
end
