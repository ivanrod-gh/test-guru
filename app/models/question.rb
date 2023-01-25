# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:base) if answers.length > 4
  end
end
