class CreateHoldings < ActiveRecord::Migration[5.1]
  def change
    create_table :holdings do |t|
      t.string :title, null: false
      t.string :section, null: false
      t.timestamps
    end
  end
end
