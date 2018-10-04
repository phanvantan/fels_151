class Lesson < ApplicationRecord
  has_many :lesson_questions, dependent: :destroy
  has_many :questions, through: :lesson_questions
end
