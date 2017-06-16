class AddUserToBookBorrow < ActiveRecord::Migration[5.0]
  def change
    add_reference :book_borrows, :user, foreign_key: true
  end
end
