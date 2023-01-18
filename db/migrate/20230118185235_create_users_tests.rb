class CreateUsersTests < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tests, id: false do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
