class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false, index: {unique: true}
      t.string :picture, null: false
      t.string :requirement_data

      t.belongs_to :user, foreign_key: true
      t.belongs_to :requirement, foreign_key: { to_table: :badge_requirements }

      t.timestamps
    end
  end
end
