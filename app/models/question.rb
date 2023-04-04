# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy, foreign_key: 'current_question_id'
  has_many :gists, dependent: :destroy

  validates :body, presence: true, length: { minimum: 5 }
end

