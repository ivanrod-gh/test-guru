module AnswersHelper
  def answer_header(answers)
    answers.persisted? ? I18n.t('.admin.answers.edit.header') : I18n.t('.admin.answers.new.header')
  end
end
