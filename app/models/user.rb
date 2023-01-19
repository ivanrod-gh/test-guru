# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: :users_tests, dependent: :destroy

  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
