class Answer < ApplicationRecord
  belongs_to :question
  scope :find_by_anwer, -> answer_id {where id: answer_id}
  validates :content, presence: true,
   length: {maximum: Settings.answer.content.maximum}

end
