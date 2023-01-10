class AddReferenceFromQuestionsToTests < ActiveRecord::Migration[6.1]
  def change
    change_table :questions do |t|
      t.belongs_to :test, foreign_key: true
    end
  end
end
