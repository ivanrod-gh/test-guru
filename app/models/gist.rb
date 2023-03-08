# frozen_string_literal: true

class Gist < ApplicationRecord
  MAXIMUM_VIEW_STRING_LENGTH = 25

  belongs_to :user
  belongs_to :question
end
