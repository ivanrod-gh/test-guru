# frozen_string_literal: true

class BadgeRequirement < ApplicationRecord
  PASSED_PERCENT = {
    HALF: 50,
    COMPLETELY: 100
  }.freeze

  has_many :badges, dependent: :destroy
end
