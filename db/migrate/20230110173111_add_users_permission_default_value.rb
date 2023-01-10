class AddUsersPermissionDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :permission, from: nil, to: 'participant')
  end
end
