# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :initialize_test, only: %i[index new]
  before_action :find_test, only: %i[show edit update start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    find_test.destroy
    redirect_to tests_path
  end

  def start
    @user = User.find(session[:user_id])
    @user.passed_tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def initialize_test
    @test = Test.new
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :user_id)
  end

  def rescue_with_test_not_found
    render plain: "Ошибка: Тест не найден"
  end
end
