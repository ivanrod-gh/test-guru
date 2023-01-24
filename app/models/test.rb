# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :users_tests, dependent: :destroy
  has_many :passed_users, through: :users_tests, source: :user
  has_many :questions, dependent: :destroy

  def self.test_names_reversed_by_category(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc)
        .pluck(:title)
  end
end
