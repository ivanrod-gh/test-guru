class AddReferenceFromTestsToCategories < ActiveRecord::Migration[6.1]
  def change
    change_table :tests do |t|
      t.belongs_to :category, foreign_key: true
    end
  end
end
