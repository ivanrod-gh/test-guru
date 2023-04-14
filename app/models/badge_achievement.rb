# frozen_string_literal: true

class BadgeAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :awards, lambda { |test_passage|
                   where(
                     "user_id = ? AND updated_at > ? AND updated_at < ?",
                     test_passage.user_id,
                     test_passage.created_at,
                     test_passage.updated_at
                   )
                 }

  scope :recieved, lambda { |user, badge|
                  where("user_id = ? AND badge_id = ?", user.id, badge.id)
                }
end
