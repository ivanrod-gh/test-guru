# frozen_string_literal: true

class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def new; end

  def create
    if FeedbacksMailer.feedback_to_developer(params[:body], current_user).deliver_now
      redirect_to feedbacks_path, notice: t('.mail_sended')
    else
      flash.now[:alert] = t('.mail_is_not_sended')
      render :new
    end
  end
end
