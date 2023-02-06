# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit]
  before_action :find_test, only: %i[create index]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = find_test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question = find_question
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    if question.persisted?
      render plain: "Ошибка: Неудачная попытка удаления"
    else
      redirect_to test_questions_path(question.test)
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Ошибка: Вопрос или вопросы не найдены"
  end
end
