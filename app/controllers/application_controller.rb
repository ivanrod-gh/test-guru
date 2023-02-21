# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :admin?

  def after_sign_in_path_for(_user)
    flash[:notice] = "Привет, #{current_user.first_name}!"
    admin? ? admin_tests_path : tests_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def admin?
    current_user.access_level == 'Admin'
  end
end
