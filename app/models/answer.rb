# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true, length: { minimum: 1 }
  validate :validate_answer_count, on: :create

  private

  def validate_answer_count
    errors.add(:base, "Количество ответов у одного вопроса не может быть более 4") if
      Answer.where(question_id: question.id).count >= 4
  end
end
