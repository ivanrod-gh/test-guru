# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :passed_tests, through: :users_tests, source: :test

  def tests_by_level(test_level)
    passed_tests.where(level: test_level)
  end
end
