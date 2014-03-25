class Addcountercache < ActiveRecord::Migration
  def up
    add_column :posts, :comments_count, :integer
  end

  def down
    remove_column :posts, :comments_count
  end
end
