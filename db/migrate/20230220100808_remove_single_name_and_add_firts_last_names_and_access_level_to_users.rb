class RemoveSingleNameAndAddFirtsLastNamesAndAccessLevelToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :name
    remove_column :users, :name, :string
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :access_level, :string, null: false, default: 'User'
    add_index :users, :access_level
  end
end
