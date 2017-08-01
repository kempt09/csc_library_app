class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.string :title, null: false
      t.string :subtitle, null: false
      t.integer :publisher_id, null: true, index: true
      t.integer :holding_id, null: false, index: true
      t.timestamps
    end
  end
end
