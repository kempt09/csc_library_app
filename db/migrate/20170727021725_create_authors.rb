class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.integer :admin_id, null: false
      t.timestamps
    end
  end
end
