# frozen_string_literal: true

class BadgeAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :awards, lambda { |test_passage|
                   where(
                     "user_id = ? and updated_at > ? and updated_at < ?",
                     test_passage.user_id,
                     test_passage.created_at,
                     test_passage.updated_at
                   )
                 }

  scope :given, lambda { |user, badge|
                  where("user_id = ? and badge_id = ?", user.id, badge.id)
                }
end
