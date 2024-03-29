# frozen_string_literal: true

class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.published
  end

  def start
    @test = Test.find(params[:id])
    if @test.published
      current_user.passed_tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, alert: t('.unavailable_test')
    end
  end

  private

  def rescue_with_test_not_found
    render plain: "Ошибка: Тест не найден"
  end
end
