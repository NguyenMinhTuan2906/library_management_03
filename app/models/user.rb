class User < ApplicationRecord
  before_save :email_downcase

  has_many :book_borrows
  has_many :books, through: :book_borrows
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.password.minimum}

  private

  def email_downcase
    email_downcase!
  end
end
