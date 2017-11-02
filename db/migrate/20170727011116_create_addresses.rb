class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :apt
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false, default: 'US'
      t.string :zip, null: false
      t.integer :admin_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
