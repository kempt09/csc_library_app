class CreateCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :circulations do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :cost, null: false, default: '0.0'
      t.integer :holding_id, null: false, index: true
      t.integer :publisher_id, null: true, index: true
      t.timestamps
    end
  end
end
