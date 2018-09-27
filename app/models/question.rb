class Question < ApplicationRecord
  # belongs_to :lesson
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates :content, presence: true,
   length: {maximum: Settings.question.model.content.maximum}
end
