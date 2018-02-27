class Answer < ApplicationRecord
  validates :body, presence: true
  validate :validate_max_answers

  belongs_to :question
  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:body) if Answer.where(question_id: question_id).count >= 4
  end
end
