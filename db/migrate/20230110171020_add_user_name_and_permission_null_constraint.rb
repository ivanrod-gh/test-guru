class AddUserNameAndPermissionNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :permission, false)
  end
end
