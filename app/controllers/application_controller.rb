# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  protected

  def authenticate_user!
    unless current_user
      session[:request_path] = request.path
      redirect_to login_path, alert: 'Требуется авторизация!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
