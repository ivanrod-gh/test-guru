# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @response = github_gist
    @response.success? ? database_gist : gist_failure
    redirect_to @test_passage, flash: { notice_html: t('.success', url: @response.gist_url) }
  rescue
    gist_failure
  end

  private

  def github_gist
    client = Octokit::Client.new('access_token': ENV['GITHUB_GIST_ACCESS_TOKEN'])
    GistQuestionService.new(@test_passage.current_question, client).post
  end

  def database_gist
    Gist.create(
      question: @test_passage.current_question,
      link: @response.gist_url,
      user: current_user
    )
  end

  def gist_failure
    redirect_to @test_passage, alert: t('.failure')
  end
end
