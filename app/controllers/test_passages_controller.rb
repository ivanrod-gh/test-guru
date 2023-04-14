# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_passage_not_found

  def show
    @test_passage.update_self_updated_at if @test_passage.test.time.present?
    redirect_to result_test_passage_path(@test_passage) if @test_passage.current_question.nil?
  end

  def update
    time_enough? ? @test_passage.accept!(params[:answer_ids]) : stop_passage
    if @test_passage.completed?
      @test_passage.check_successful
      BadgeAchievementService.new(@test_passage).call if @test_passage.check_successful
      TestsMailer.completed_test(@test_passage).deliver_now if @test_passage.successful
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def time_enough?
    return true if @test_passage.test.time.nil?

    @test_passage.update_self_updated_at
    @test_passage.time_passed <= @test_passage.test.time * 60
  end

  def stop_passage
    @test_passage.update(current_question: nil)
  end

  def rescue_with_test_passage_not_found
    render plain: "Ошибка: Прохождение теста не найдено"
  end
end
