module QuestionsHelper
  def question_header(question)
    text = @question.persisted? ? I18n.t('.admin.questions.edit.header') : I18n.t('.admin.questions.new.header')
    text.concat(" \"#{@question.test.title}\"")
  end
end
