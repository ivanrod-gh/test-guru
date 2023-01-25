# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:base) if Answer.where(question_id: question.id).count >= 4 && new_record?
  end
end
