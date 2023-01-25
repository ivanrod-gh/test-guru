# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :users_tests, dependent: :destroy
  has_many :passed_users, through: :users_tests, source: :user
  has_many :questions, dependent: :destroy

  scope :joins_category_by_title, lambda { |category_title|
                                    joins(:category)
                                      .where(categories: { title: category_title })
                                  }
  scope :simples, -> { where(level: 0..1) }
  scope :averages, -> { where(level: 2..4) }
  scope :hards, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.test_names_reversed_by_category(category_title)
    joins_category_by_title(category_title).order(title: :desc).pluck(:title)
  end
end
