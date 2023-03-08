# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  protected

  def admin_required!
    redirect_to root_path, alert: t('.admin_required!') unless admin?
  end
end
