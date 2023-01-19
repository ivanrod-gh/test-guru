# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :users, join_table: :users_tests, dependent: :destroy

  def self.test_names_reversed_by_category(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc)
        .pluck(:title)
  end
end
