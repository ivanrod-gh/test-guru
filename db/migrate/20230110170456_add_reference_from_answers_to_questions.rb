class AddReferenceFromAnswersToQuestions < ActiveRecord::Migration[6.1]
  def change
    change_table :answers do |t|
      t.belongs_to :question, foreign_key: true
    end
  end
end
