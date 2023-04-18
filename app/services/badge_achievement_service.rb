# frozen_string_literal: true

class BadgeAchievementService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      next unless BadgeAchievement.recieved(@test_passage.user, badge).count.zero?

      @badge = badge
      check_requirement_and_reward
    end
    @test_passage.update(updated_at: Time.current)
  end

  private

  def check_requirement_first_pass
    return if Test.find_by(id: @badge.requirement_data).nil? || @test_passage.test.id != @badge
              .requirement_data.to_i

    passages = TestPassage.where("user_id = ? AND test_id = ?", @test_passage.user.id, @badge.requirement_data)
    passages.count == 1
  end

  def check_requirement_100_percents
    return if Test.find_by(id: @badge.requirement_data).nil? || @test_passage.test.id != @badge
              .requirement_data.to_i

    @test_passage.complete_percent == BadgeRequirement::PASSED_PERCENT[:COMPLETELY]
  end

  def check_requirement_all_in_category
    return if Category.find_by(id: @badge.requirement_data).nil? || @test_passage
              .test.category.id != @badge.requirement_data.to_i

    success_tests = Test.joins_test_passages_by_category_id(@badge.requirement_data.to_i)
                        .passage_successful_by_user(@test_passage.user)
    (Test.where(category_id: @badge.requirement_data.to_i) - success_tests).empty?
  end

  def check_requirement_percent_of_all
    tests_remaining = Test.all - Test.joins(:test_passages).passage_successful_by_user(@test_passage.user)
    pass_percent = BadgeRequirement::PASSED_PERCENT[:COMPLETELY]
    (tests_remaining.count.to_f / Test.count) * 100 <= pass_percent - @badge.requirement_data.to_i
  end

  def check_requirement_and_reward
    @test_passage.user.received_achievements.push(@badge) if CHECK_METHODS[@badge.requirement_id].bind(self).call
  end

  CHECK_METHODS = {
    1 => instance_method(:check_requirement_first_pass),
    2 => instance_method(:check_requirement_100_percents),
    3 => instance_method(:check_requirement_all_in_category),
    4 => instance_method(:check_requirement_percent_of_all)
  }.freeze
end
