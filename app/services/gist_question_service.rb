# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client_name = nil)
    @question = question
    @test = @question.test
    @client = initialize_client(client_name) if client_name || GitHubClient.new
  end

  def initialize_client(client_name)
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_GIST_ACCESS_TOKEN')) if client_name == Octokit
  end

  def post
    @response = @client.create_gist(gist_params)
  end

  def success?
    if @response.instance_of?(Faraday::Response)
      @response.success?
    elsif Gem.loaded_specs.key?('octokit') && @response.instance_of?(Sawyer::Resource)
      @client.last_response.status == 201
    end
  end

  def gist_url
    if @response.instance_of?(Faraday::Response)
      JSON.parse(@response.body)['html_url']
    elsif Gem.loaded_specs.key?('octokit') && @response.instance_of?(Sawyer::Resource)
      @response[:html_url]
    end
  end

  private

  def gist_params
    {
      description: I18n.t('.services.gist.header', test_title: @test.title),
      public: false,
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << ('-' * 10).to_s
    content << @question.answers.pluck(:body)
    content.join("\n")
  end
end
