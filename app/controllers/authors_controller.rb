class AuthorsController < ApplicationController
  before_action :load_author

  def show
    @books = Book.where(author_id: @author.id)
  end
end
