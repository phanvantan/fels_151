class Lesson < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :title, presence: true
  accepts_nested_attributes_for :questions

end
