class AddBookToBookBorrow < ActiveRecord::Migration[5.0]
  def change
    add_reference :book_borrows, :book, foreign_key: true
  end
end
