# frozen_string_literal: true

class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    @send = FeedbacksMailer.feedback_to_developer(params[:body], current_user).deliver_now
  end
end
