class Answer < ApplicationRecord
  belongs_to :question
  validates :content, presence: true,
   length: {maximum: Settings.answer.content.maximum}
end
