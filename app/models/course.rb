class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  mount_uploader :picture, PictureUploader
end
