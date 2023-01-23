# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author_user, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :passed_users, class_name: "User", join_table: :users_tests, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.test_names_reversed_by_category(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc)
        .pluck(:title)
  end
end
