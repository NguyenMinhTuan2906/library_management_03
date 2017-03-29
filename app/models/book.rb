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
  scope :search, ->q{where "name LIKE ?", "%#{q}%"}

  private

  def picture_size
    if image.size > 1.megabytes
      errors.add :image, I18n.t(".less_than")
    end
  end
end
