class Admin::BookBorrowsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :find_book, only: [:destroy]
  before_action :find_relationship_borrow, only: [:update, :destroy]
  layout "admin"

  def index
    @book_borrows = BookBorrow.where(request_status: "pending")
  end

  def update
    if params[:book_borrow][:request] == "accept"
      @book_borrow.update_attributes request_status: "borrowing"
      @book_borrow.book.update_attributes status: false
      flash[:success] = t "user_accept"
    else
      @book_borrow.update_attributes request_status: "rejected"
      flash[:danger] = t "user_reject"
    end
    @book_borrow.save
    @book_borrow.book.save
    redirect_to admin_book_borrows_url
  end

  def destroy
    find_relationship_borrow
    type = @book_borrow.destroy ? "success" : "danger"
    flash[:"#{type}"] = t ".success_delete"
    redirect_to admin_book_borrows_url
  end

  private

  def find_relationship_borrow
    @book_borrow = BookBorrow.find_by id: params[:id]
  end

  def find_book
    @book = Book.find_by id: params[:book_id]
  end
end
