class Book < ApplicationRecord
  has_many :book_borrows
  has_many :users, through: :book_borrows
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  validates :name, presence: true,
    length: {maximum: Settings.name.maximum},
    uniqueness: {scope: :author_id}
  validates :paperback, presence: true

  delegate :name, to: :author, prefix: true
  delegate :name, to: :category, prefix: true
  delegate :name, to: :publisher, prefix: true
end
