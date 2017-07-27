class CreateLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :log_entries do |t|
      t.integer :user_id, null: false
      t.integer :holding_section_id, null: false
      t.integer :item_id, null: false
      t.datetime :checkout_dt, null: false
      t.datetime :checkin_dt, null: true
      t.datetime :due_dt, null: false
      t.timestamps
    end
  end
end
