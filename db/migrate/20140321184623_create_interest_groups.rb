class CreateInterestGroups < ActiveRecord::Migration
  def change
    create_table :interest_groups do |t|
      t.string :group_name, null: false
      t.string :creator, null: false
      t.text :optional_description
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
