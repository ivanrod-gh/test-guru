# frozen_string_literal: true

class BadgeAchievementService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def calculate_achievements
    return unless @test_passage.successful

    Badge.all.each do |badge|
      next unless BadgeAchievement.recieved(@test_passage.user, badge).count.zero?

      @badge = badge
      @requirement_id = badge.requirement_id
      @requirement_data = badge.requirement_data
      check_requirement_and_reward
    end
    @test_passage.update(updated_at: Time.current)
  end

  private

  def check_requirement_first_pass
    return unless Test.find_by(id: @requirement_data).present? && @test_passage.test.id == @requirement_data.to_i

    passages = TestPassage.where("user_id = ? AND test_id = ?", @test_passage.user.id, @requirement_data)
    return unless passages.count == 1

    true
  end

  def check_requirement_100_percents
    return unless Test.find_by(id: @requirement_data).present? && @test_passage.test.id == @requirement_data.to_i

    return unless @test_passage.complete_percent == BadgeRequirement::PASSED_PERCENT[:COMPLETELY]

    true
  end

  def check_requirement_all_in_category
    return unless Category.find_by(id: @requirement_data).present? && @test_passage
                  .test.category.id == @requirement_data.to_i

    success_tests = Test.joins_test_passages_by_category_id(@requirement_data.to_i)
                        .passage_successful_by_user(@test_passage.user)
    return unless (Test.where(category_id: @requirement_data.to_i) - success_tests).empty?

    true
  end

  def check_requirement_percent_of_all
    tests_remaining = Test.all - Test.joins(:test_passages).passage_successful_by_user(@test_passage.user)
    pass_percent = BadgeRequirement::PASSED_PERCENT[:COMPLETELY]
    return unless (tests_remaining.count.to_f / Test.count) * 100 <= pass_percent - @requirement_data.to_i

    true
  end

  def check_requirement_and_reward
    return unless CHECK_METHODS[@requirement_id][:reference].bind(self).call

    @test_passage.user.received_achievements.push(@badge)
  end

  CHECK_METHODS = {
    1 => { reference: instance_method(:check_requirement_first_pass) },
    2 => { reference: instance_method(:check_requirement_100_percents) },
    3 => { reference: instance_method(:check_requirement_all_in_category) },
    4 => { reference: instance_method(:check_requirement_percent_of_all) }
  }.freeze
end
