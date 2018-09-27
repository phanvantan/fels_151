class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :lesson
  accepts_nested_attributes_for :answers
  scope :find_by_question, -> question_id do
    where("id = #{question_id}").first.content
  end
  enum category: {radio: 0, checkbox: 1}
  validates :content, presence: true,
   length: {maximum: Settings.question.model.content.maximum}

end
