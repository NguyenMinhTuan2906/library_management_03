class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  validates :description, presence: true
  scope :search, ->q{where "name LIKE ?", "%#{q}%"}
end
