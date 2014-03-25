class Removecolumnfromjointable < ActiveRecord::Migration
   def up
    remove_column :user_groups, :role
  end

  def down
    add_column :user_groups, :role, :string, null: false
  end
end
