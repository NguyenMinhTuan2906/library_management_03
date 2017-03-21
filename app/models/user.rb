class User < ApplicationRecord
  has_many :book_borrows
  has_many :books, through: :book_borrows
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
end
