class CreateCirculationLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :circulation_log_entries do |t|
      t.belongs_to :circulation, index: true
      t.belongs_to :log_entry, index: true
      t.timestamps
    end
  end
end
