class BookBorrow < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum request_status: [:pending, :borrowing, :rejected]

  validates :user, presence: true
  validates :book, presence: true
  validates :borrow_date, presence: true
  validates :expired_date, presence: true
end
