class LessonQuestion < ApplicationRecord
  belongs_to :question, class_name: "Question"
  belongs_to :lesson, class_name: "Lesson"
  validates :question_id, presence: true
  validates :lesson_id, presence: true
end
