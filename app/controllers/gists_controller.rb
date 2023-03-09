# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :create_remote_record, only: :create

  def create_remote_record
    @test_passage = TestPassage.find(params[:test_passage_id])
    @service_response = create_github_gist
  end

  def create
    @service_response.success? ? create_database_gist : (show_gist_failure && return)
    redirect_to @test_passage, flash: { notice_html: t('.success', url: @service_response.gist_url) }
  rescue
    show_gist_failure
  end

  private

  def create_github_gist
    client = Octokit::Client.new('access_token': ENV['GITHUB_GIST_ACCESS_TOKEN'])
    GistQuestionService.new(@test_passage.current_question, client).post
  end

  def create_database_gist
    Gist.create(
      question: @test_passage.current_question,
      link: @service_response.gist_url,
      user: current_user
    )
  end

  def show_gist_failure
    redirect_to @test_passage, alert: t('.failure')
  end
end
