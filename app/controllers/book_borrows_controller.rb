class BookBorrowsController < ApplicationController
  before_action :find_user, only: [:create, :destroy]
  before_action :find_book, only: [:create]
  before_action :correcting_user, only: :destroy

  def create
    @borrow = @user.book_borrows.build book_borrow_params
    if @borrow.save
      flash[:success] = t ".borrow_success"
      redirect_to @user
      @borrow.book.update_attributes status: false
    else
      flash[:danger] = t ".borrow_fail"
      redirect_to @book
    end
  end

  def destroy
    find_relationship_borrow
    type = @book_borrow.destroy ? "success" : "danger"
    flash[:"#{type}"] = t ".success_delete"
    redirect_to @user
  end

  private

  def book_borrow_params
    params.require(:book_borrow).permit :expired_date, :borrow_date, :user_id,
      :book_id
  end

  def find_relationship_borrow
    @book_borrow = @user.book_borrows.find_by id: params[:id]
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t ".none"
      redirect_to root_url
    end
  end

  def find_book
    @book = Book.find_by id: params[:book_borrow][:book_id]
    unless @book
      flash[:danger] = t "books.error.book_not_found"
      redirect_to root_url
    end
  end

  def correcting_user
    find_user
    unless current_user? @user
      flash[:danger] = t ".only_admin"
      redirect_to root_url
    end
  end
end
