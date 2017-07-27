class CreateUserLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_log_entries do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :log_entry, foreign_key: true
      t.timestamps
    end
  end
end
