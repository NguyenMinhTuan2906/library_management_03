class Book < ApplicationRecord
  has_many :book_borrows
  has_many :users, through: :book_borrows
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
end
