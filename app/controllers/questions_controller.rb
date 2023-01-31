# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_test, only: %i[new create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<%= Test.find(params[:test_id]).questions.pluck(:body) %>"
  end

  def show; end

  def new; end

  def create
    question = @test.questions.create(question_params)
    render plain: question.valid? ? "Вопрос успешно создан" : question.errors.inspect
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    render plain: question.persisted? ? "Ошибка: Неудачная попытка удаления" : "Вопрос успешно удален"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Ошибка: Вопрос или вопросы не найдены"
  end
end
