class CreateBookBorrows < ActiveRecord::Migration[5.0]
  def change
    create_table :book_borrows do |t|
      t.datetime :expired_date
      t.datetime :borrow_date
      t.integer :request_status, null: false, default: 0

      t.timestamps
    end
  end
end
