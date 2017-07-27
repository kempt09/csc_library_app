class CreatePeriodicals < ActiveRecord::Migration[5.1]
  def change
    create_table :periodicals do |t|
      t.string :title, null: false
      t.integer :volume, null: false, default: 1
      t.integer :volume_no, null: false, default: 1
      t.integer :holding_id, null: false, index: true
      t.integer :publisher_id, null: true, index: true
      t.timestamps
    end
  end
end
