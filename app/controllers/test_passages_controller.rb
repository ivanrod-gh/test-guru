# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, obly: %i[show update result]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_passage_not_found

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.current_question.nil?
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now if @test_passage.success?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_test_passage_not_found
    render plain: "Ошибка: Прохождение теста не найдено"
  end
end
