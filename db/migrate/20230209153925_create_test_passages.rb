class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.belongs_to :user, foreign_key: true, index: false
      t.belongs_to :test, foreign_key: true, index: false
      t.belongs_to :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, default: 0

      t.timestamps
    end

    add_index :test_passages, [:user_id, :test_id]
  end
end
