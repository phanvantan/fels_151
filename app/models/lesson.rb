class Lesson < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  has_many :test_details
  has_many :user_test, through: :test_details
  validates :title, presence: true

end
