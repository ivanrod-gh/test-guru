# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  protected

  def admin_required!
    redirect_to root_path, alert: 'Для просмотра этой страницы у вас недостаточно прав доступа' unless admin?
  end
end
