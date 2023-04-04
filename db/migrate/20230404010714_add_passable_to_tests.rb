class AddPassableToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :passable?, :boolean, default: false
  end
end
