# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(test_level)
    return nil if tests.nil? || Test.find_by(level: test_level).nil?

    user_test_ids = []
    tests.split('/').each { |test| user_test_ids.push test.split('=')[0].to_i }
    Test.where(id: user_test_ids).where(level: test_level)
  end
end
