# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def feedback_to_developer(body, current_user)
    @user = current_user
    @body = body

    mail to: User.where(access_level: 'Admin').first.email
  end
end
