class BooksController < ApplicationController
  before_action :load_book, only: :show

  def show
  end

  def index
    @books = Book.all
  end
end
