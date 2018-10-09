class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  has_one_attached :image
end
