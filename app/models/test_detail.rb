class TestDetail < ApplicationRecord
  belongs_to :user_test
  belongs_to :lesson
  validates :lesson_id, presence: true
  validates :user_test_id, presence: true
  validates :answer, presence: true
  validates :question, presence: true

end
