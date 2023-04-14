# frozen_string_literal: true

class TestPassage < ApplicationRecord
  TEST_SUCCESSFULLY_COMPLETE_MIN_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    save!
  end

  def completed?
    current_question.nil?
  end

  def check_successful
    update(successful: true) if success?
  end

  def complete_percent
    ((correct_questions / test.questions.count.to_f) * 100).to_i
  end

  def success?
    complete_percent >= TEST_SUCCESSFULLY_COMPLETE_MIN_PERCENT
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def questions_count
    test.questions.count
  end

  def update_self_updated_at
    update(updated_at: Time.current)
  end

  def time_passed
    (updated_at - created_at).to_i
  end

  def time_left
    return nil if self.test.time.nil?
    (test.time * 60) - time_passed
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    answer_ids.nil? ? false : correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.corrects
  end
end
