# frozen_string_literal: true

class Answer < ApplicationRecord
  MAXIMUM_ANSWERS_COUNT = 4

  belongs_to :question

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true, length: { minimum: 1 }
  validate :validate_answer_count, on: :create

  private

  def validate_answer_count
    answers_count = question.answers.count
    return if answers_count < MAXIMUM_ANSWERS_COUNT

    errors.add(:base, I18n.t('admin.answers.state.maximum_answers_count', count: answers_count))
  end
end
