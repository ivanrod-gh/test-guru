# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :users_tests

  def self.test_names_reversed_by_category(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc)
        .pluck(:title)
  end
end
