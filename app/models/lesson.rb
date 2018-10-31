class Lesson < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  belongs_to :course
  has_many :test_details
  has_many :user_tests, through: :test_details
  validates :title, presence: true
  accepts_nested_attributes_for :questions

end
