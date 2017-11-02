class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.string :name, null: false, index: true
      t.integer :admin_id, null: false
      t.timestamps
    end
  end
end
