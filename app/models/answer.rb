# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true
end
