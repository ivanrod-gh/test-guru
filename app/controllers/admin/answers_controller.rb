# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :check_test_published, only: %i[new create edit update destroy]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def check_test_published
    test = (@question.test if @question) || @answer.question.test
    redirect_to admin_test_path(test), alert: t('admin.tests.frozen') and return if test.published
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
