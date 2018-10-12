class TestDetail < ApplicationRecord
  belongs_to :user_test
  belongs_to :lesson
  scope :find_question, -> question {where question: question}
end
