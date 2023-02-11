module QuestionsHelper
  def question_header(question)
    text = @question.persisted? ? 'Редактировать текст вопроса' : 'Создать вопрос для'
    text.concat(" \"#{@question.test.title}\"")
  end
end
