# frozen_string_literal: true

module QuestionsHelper
  def question_header
    text = @question.persisted? ? I18n.t('.admin.questions.edit.header') : I18n.t('.admin.questions.new.header')
    text.concat(" \"#{@question.test.title}\"")
  end
end
