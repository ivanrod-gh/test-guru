class CreateBadgeAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_achievements do |t|
      t.belongs_to :user, foreign_key: true, index: false
      t.belongs_to :badge, foreign_key: true, index: false

      t.timestamps
    end

    add_index :badge_achievements, [:user_id, :badge_id]
  end
end
