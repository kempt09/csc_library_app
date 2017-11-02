class CreateCustomerLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_log_entries do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :log_entry, index: true
      t.timestamps
    end
  end
end
