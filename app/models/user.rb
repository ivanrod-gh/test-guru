# frozen_string_literal: true

class User < ApplicationRecord
  has_many :author_tests, class_name: "Test", dependent: :destroy
  has_and_belongs_to_many :passed_tests, class_name: "Test", join_table: :users_tests, dependent: :destroy

  def tests_by_level(test_level)
    passed_tests.where(level: test_level)
  end
end
