class AddNotNullToComments < ActiveRecord::Migration
  def up
    remove_column :comments, :user_id
    remove_column :comments, :post_id
    add_column :comments, :user_id, :integer, null: false
    add_column :comments, :post_id, :integer, null: false
  end

  def down
    remove_column :comments, :user_id
    remove_column :comments, :post_id
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
  end

end
