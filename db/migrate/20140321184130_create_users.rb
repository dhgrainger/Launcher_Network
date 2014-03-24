class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_address, null: false
      t.string :launcher_or_ee, null: false
      t.text :optional_fact
      t.integer :interest_group_id, null: false

      t.timestamps
    end
  end
end
