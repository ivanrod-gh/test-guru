module QuestionsHelper
  def question_header(question)
    text = @question.persisted? ? 'Редактировать текст вопроса' : 'Создать новый вопрос для'
    text.concat(" \"#{@question.test.title}\"")
  end
end
