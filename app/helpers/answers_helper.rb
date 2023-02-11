module AnswersHelper
  def answer_header(answers)
    answers.persisted? ? 'Редактировать' : 'Создать'
  end
end
