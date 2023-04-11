# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :requirement, class_name: 'BadgeRequirement'
  has_many :badge_achievements, dependent: :destroy
  has_many :given_users, through: :badge_achievements, source: :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :picture, presence: true, length: { minimum: 5 }
  validate :validate_requirement_data, on: :create

  def calculate_achievement(test_passage)
    check_requirement(requirement_id, test_passage, requirement_data)
    test_passage.update(updated_at: Time.current)
  end

  private

  def validate_requirement_data
    if (requirement_id == 1 || requirement_id == 2) && Test.find_by(id: requirement_data.to_i).nil?
      errors.add(:base, I18n.t('admin.badges.badge.no_test'))
    elsif requirement_id == 3 && Category.find_by(id: requirement_data.to_i).nil?
      errors.add(:base, I18n.t('admin.badges.badge.no_category'))
    end
  end

  def check_requirement_first_pass(test_passage, data_test_id)
    return unless test_passage.test.id == data_test_id.to_i && Test.find_by(id: data_test_id).present?

    passages = TestPassage.where("user_id = ? AND test_id = ?", test_passage.user.id, data_test_id)
    return unless passages.count == 1

    if test_passage.successful && BadgeAchievement.given(test_passage.user, self).count.zero?
      test_passage.user.received_achievements.push(self)
    end
  end

  def check_requirement_100_percents(test_passage, data_test_id)
    return unless test_passage.test.id == data_test_id.to_i && Test.find_by(id: data_test_id).present?

    return unless test_passage.complete_percent == BadgeRequirement::PASSED_PERCENT[:COMPLETELY]

    return unless BadgeAchievement.given(test_passage.user, self).count.zero?

    test_passage.user.received_achievements.push(self)
  end

  def check_requirement_all_in_category(test_passage, data_category_id)
    return unless test_passage.test.category.id == data_category_id.to_i && Category
                  .find_by(id: data_category_id).present?

    success_count = TestPassage.joins_test_by_category_id(data_category_id.to_i)
                               .where("test_passages.user_id = ? and successful = true", test_passage.user.id)
                               .group(:test_id).pluck('min(test_id)').count
    return unless Test.where(category_id: data_category_id.to_i).count == success_count

    return unless BadgeAchievement.given(test_passage.user, self).count.zero?

    test_passage.user.received_achievements.push(self)
  end

  def check_requirement_percent_of_all(test_passage, data_percent)
    successful_passages_count = TestPassage.where("test_passages.user_id = 1 and successful = true")
                                           .group(:test_id).pluck('min(test_id)').count
    return unless  (successful_passages_count.to_f / Test.count) * 100 >= data_percent.to_i

    return unless  BadgeAchievement.given(test_passage.user, self).count.zero?

    test_passage.user.received_achievements.push(self)
  end

  def check_requirement(key, test_passage, requirement_data)
    CHECK_METHODS[key][:reference].bind(self).call(test_passage, requirement_data)
  end

  CHECK_METHODS = {
    1 => { reference: instance_method(:check_requirement_first_pass) },
    2 => { reference: instance_method(:check_requirement_100_percents) },
    3 => { reference: instance_method(:check_requirement_all_in_category) },
    4 => { reference: instance_method(:check_requirement_percent_of_all) }
  }.freeze
end
