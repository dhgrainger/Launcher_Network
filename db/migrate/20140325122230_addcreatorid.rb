class Addcreatorid < ActiveRecord::Migration
  def up
    remove_column :interest_groups, :creator
    add_column :interest_groups, :creator_id, :integer, null: false
  end

  def down
    remove_column :interest_groups, :creator_id
    add_column :interest_groups, :creator, :string, null: false
  end
end
