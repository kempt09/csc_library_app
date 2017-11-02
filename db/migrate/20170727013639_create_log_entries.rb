class CreateLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :log_entries do |t|
      t.integer :admin_id, null: false
      t.integer :customer_id, null: false
      t.integer :circulation_id, null: false
      t.datetime :checkout_dt, null: false
      t.datetime :checkin_dt, null: true
      t.datetime :due_dt, null: false
      t.timestamps
    end
  end
end
