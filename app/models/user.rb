# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests
  has_many :users_tests

  def tests_by_level(test_level)
    users_tests.joins(:test).where(tests: { level: test_level }).pluck(:title)
  end
end
