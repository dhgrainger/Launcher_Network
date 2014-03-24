class RemoveInterestGroupUserId < ActiveRecord::Migration
  def up
    remove_column :interest_groups, :user_id
  end

  def down
    add_column :interest_groups, :user_id, :integer
  end
end
