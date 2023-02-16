# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:request_path) || root_path
    else
      flash.now[:alert] = 'Пожалуйста, введите корректный адрес электронной почты и пароль!'
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
