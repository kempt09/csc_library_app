class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.string :name
      t.integer :admin_id, null: false
      t.text :notes
      t.timestamps
    end
  end
end
