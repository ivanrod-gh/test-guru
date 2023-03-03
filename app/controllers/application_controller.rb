# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :admin?

  def after_sign_in_path_for(_user)
    flash[:notice] = I18n.locale == :ru ? "Привет, #{current_user.first_name}!" : "Hello #{current_user.first_name}!"
    admin? ? admin_tests_path : tests_path
  end

  def default_url_options
    if I18n.locale.to_s != I18n.default_locale.to_s
      { lang: I18n.locale }
    else
      { }
    end
  end

  protected

  def set_locale
    I18n.locale_available?(params[:lang]) ? I18n.locale = params[:lang] : I18n.locale = I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def admin?
    current_user.admin?
  end
end
