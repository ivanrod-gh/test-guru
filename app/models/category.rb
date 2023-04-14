# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(id: :asc) }

  validates :title, presence: true
end
