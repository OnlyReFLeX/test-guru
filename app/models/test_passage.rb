class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question
  before_update :before_update_check_timeleft
  before_update :before_update_test_passed

  scope :correct_passed_tests, ->(user) {
    user.test_passages.where(passed: true)
  }

  def test_passed?
    result_percent >= 85
  end

  def result_percent
    (100 * correct_questions) / test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    unless time_is_over?
      self.correct_questions += 1 if correct_answer?(answer_ids)
    end
    save!
  end

  def current_question_number
    test.questions.count - next_questions.count
  end

  private

  def time_is_over?
    (created_at + test.timeleft.minutes) < Time.now
  end

  def before_update_check_timeleft
    self.current_question = nil if time_is_over?
  end

  def before_update_test_passed
    self.passed = test_passed? if completed?
  end

  def before_save_set_question
    self.current_question = if completed?
                              test.questions.first
                            else
                              next_question
                            end
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
