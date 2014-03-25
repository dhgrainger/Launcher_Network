class AddRoletoUserGroup < ActiveRecord::Migration
  def up
    add_column :user_groups, :role, :string, null: false
  end

  def down
    remove_column :user_groups, :role
  end
end
