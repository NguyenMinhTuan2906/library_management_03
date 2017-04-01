class Book < ApplicationRecord
  has_many :book_borrows
  has_many :users, through: :book_borrows
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  mount_uploader :image, PictureUploader
  validates :name, presence: true,
    length: {maximum: Settings.name.maximum},
    uniqueness: {scope: :author_id}
  validates :paperback, presence: true
  validate  :picture_size

  private

  def picture_size
    if image.size > 1.megabytes
      errors.add(:image, "should be less than 1MB")
    end
  end
end
