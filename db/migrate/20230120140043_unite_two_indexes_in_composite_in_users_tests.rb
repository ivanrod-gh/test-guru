class UniteTwoIndexesInCompositeInUsersTests < ActiveRecord::Migration[6.1]
  def change
    remove_index :users_tests, :test_id
    remove_index :users_tests, :user_id
    add_index :users_tests, [:user_id, :test_id]
  end
end
