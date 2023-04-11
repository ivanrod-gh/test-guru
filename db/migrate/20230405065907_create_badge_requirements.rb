class CreateBadgeRequirements < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_requirements do |t|
      t.string :description, null: false

      t.timestamps
    end
  end
end
