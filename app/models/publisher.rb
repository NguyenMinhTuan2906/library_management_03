class Publisher < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  validates :description, presence: true
  validates :address, presence: true
  scope :search, ->q{where "name LIKE ?", "%#{q}%"}

  def total_book
    Book.where(publisher_id: id).count
  end
end
