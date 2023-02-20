# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.new
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.passed_tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: "Ошибка: Тест не найден"
  end
end
