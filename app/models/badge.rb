# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :requirement, class_name: 'BadgeRequirement'
  has_many :badge_achievements, dependent: :destroy
  has_many :given_users, through: :badge_achievements, source: :user

  validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :picture, presence: true, length: { minimum: 5 }
  validate :validate_requirement_data, on: :create

  private

  def validate_requirement_data
    if (requirement_id == 1 || requirement_id == 2) && Test.find_by(id: requirement_data.to_i).nil?
      errors.add(:base, I18n.t('admin.badges.badge.test_doesnt_exist'))
    elsif requirement_id == 3 && Category.find_by(id: requirement_data.to_i).nil?
      errors.add(:base, I18n.t('admin.badges.badge.category_doesnt_exist'))
    end
  end
end
