class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :lesson
  scope :find_by_question, -> question_id do
    where("id = #{question_id}").first.content
  end
  accepts_nested_attributes_for :answers
  validates :content, presence: true,
   length: {maximum: Settings.question.model.content.maximum}

end
