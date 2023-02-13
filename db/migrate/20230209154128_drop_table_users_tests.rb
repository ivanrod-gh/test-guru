class DropTableUsersTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :users_tests, if_exists: true
  end

  def down
    create_table :users_tests, if_not_exists: true do |t|
      t.belongs_to :user, foreign_key: true, index: false
      t.belongs_to :test, foreign_key: true, index: false
      t.index ["user_id", "test_id"], name: "index_users_tests_on_user_id_and_test_id"
    end
  end
end
