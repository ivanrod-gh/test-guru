# frozen_string_literal: true

class GurusController < ApplicationController
  def badge_achievements
    @badge_achievements = BadgeAchievement.where(user: current_user)
  end
end
