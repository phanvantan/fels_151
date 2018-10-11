class Answer < ApplicationRecord
  belongs_to :question
  scope :find_by_anwer, -> answer_id {where id: answer_id}
  scope :find_correct, -> question_id {where question_id: question_id}
  scope :number, -> {where correct: true}

  validates :content, presence: true,
   length: {maximum: Settings.answer.content.maximum}

end
