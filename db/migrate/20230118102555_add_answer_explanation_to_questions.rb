class AddAnswerExplanationToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :answer_explanation, :string
  end
end
