class CreateCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :circulations do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :cost
      t.integer :author_id, null: false
      t.integer :publisher_id, null: true
      t.integer :admin_id, null: false
      t.timestamps
    end
  end
end
