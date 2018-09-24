class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :lesson_questions
  has_many :lessons, through: :lesson_questions
  accepts_nested_attributes_for :answers
  validates :content, presence: true,
   length: {maximum: Settings.question.model.content.maximum}
end
