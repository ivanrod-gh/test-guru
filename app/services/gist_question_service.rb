class GistQuestionService
  def initialize(question, client = nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def post
    @response = @client.create_gist(gist_params)
    self
  end

  def success?
    if @response.class == Faraday::Response
      @response.success?
    elsif Gem.loaded_specs.has_key?('octokit') && @response.class == Sawyer::Resource
      @response.id?
    end
  end

  def gist_url
    if @response.class == Faraday::Response
      JSON.parse(@response.body)['html_url']
    elsif Gem.loaded_specs.has_key?('octokit') && @response.class == Sawyer::Resource
      @response[:html_url]
    end
  end

  private

  def gist_params
    {
      'description': I18n.t('.services.gist.header', test_title: @test.title),
      'public': false,
      'files': {
        'test-guru-question.txt': {
          'content': gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << "#{'-'*10}"
    content << @question.answers.pluck(:body)
    content.join("\n")
  end
end
