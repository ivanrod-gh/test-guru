module QuestionsHelper
  def question_header(prefix, question)
    "#{prefix} теста \"#{@question.test.title}\""
  end
end
