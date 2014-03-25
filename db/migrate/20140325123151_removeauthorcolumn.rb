class Removeauthorcolumn < ActiveRecord::Migration
  def up
    remove_column :posts, :author
  end

  def down
    add_column :posts, :author, :string, null: false
  end
end
