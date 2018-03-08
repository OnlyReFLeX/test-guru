class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_frist_question, on: :create
  before_update :before_update_set_next_question

  def test_passed?
    result_procent >= 85
  end

  def result_procent
    (100 * self.correct_questions) / test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def current_question_number
    test.questions.count - next_questions.count
  end

  private

  def before_validation_set_frist_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    next_questions.first
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
