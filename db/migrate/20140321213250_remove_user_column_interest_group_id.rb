class RemoveUserColumnInterestGroupId < ActiveRecord::Migration
    def up
    remove_column :users, :interest_group_id
  end

  def down
    add_column :users, :interest_group_id, :integer
  end
end
