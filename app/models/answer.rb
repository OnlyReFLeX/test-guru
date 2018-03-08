class Answer < ApplicationRecord
  validates :body, presence: true
  validate :validate_max_answers, on: :create

  belongs_to :question
  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:base, 'Достигнут лимит ответов') if question.answers.count >= 4
  end
end
