# frozen_string_literal: true

class TestPassagesController < ApplicationController
  REST_API_STATUS_CREATED = 201

  before_action :find_test_passage, obly: %i[show update result gist]

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

  def gist
    @client = Octokit::Client.new('access_token': ENV['GITHUB_GIST_ACCESS_TOKEN'])
    GistQuestionService.new(@test_passage.current_question, @client).call
    gist_success? ? gist_successful : gist_failed
  rescue
    gist_failed
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_test_passage_not_found
    render plain: "Ошибка: Прохождение теста не найдено"
  end

  def gist_success?
    @client.last_response.status == REST_API_STATUS_CREATED
  end

  def gist_successful
    create_gist
    redirect_to @test_passage, flash: { notice_html: t('.success', url: @client.last_response.data[:html_url]) }
  end

  def create_gist
    @gist = Gist.new
    @gist.question = @test_passage.current_question
    @gist.link = @client.last_response.data[:html_url]
    @gist.user = current_user
    @gist.save
  end

  def gist_failed
    redirect_to @test_passage, alert: t('.failure')
  end
end


