# frozen_string_literal: true

class Test < ApplicationRecord
  def self.names_reversed_by_category(category_title)
    category = Category.find_by(title: category_title)
    return nil if category.nil?

    Test.where(category_id: category.id).select(:title).order(title: :desc).map(&:title)
  end
end
