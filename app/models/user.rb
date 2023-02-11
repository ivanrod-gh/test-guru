# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :passed_tests, through: :test_passages, source: :test

  validates :email, presence: true

  def tests_by_level(test_level)
    passed_tests.where(level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
