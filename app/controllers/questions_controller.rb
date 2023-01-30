# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_test, only: %i[new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_question_invalid

  def index
    render inline: "<%= Test.find(params[:test_id]).questions.pluck(:body) %>"
  end

  def show; end

  def new; end

  def create
    question = Question.create!(params.permit(:body, :test_id))
    render plain: question.id.nil? ? question.errors.inspect : "Вопрос успешно создан"
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy!
    render plain: question.persisted? ? question.errors.inspect : "Вопрос успешно удален"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = find_test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Ошибка: Вопрос или вопросы не найдены"
  end

  def rescue_with_question_invalid(exeption)
    render plain: "Ошибка: Вопрос должен содержать не менее 1 символа" if exeption.record[:body].blank?
  end
end
