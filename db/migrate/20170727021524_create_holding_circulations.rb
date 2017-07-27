class CreateHoldingCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :holding_circulations do |t|
      t.belongs_to :holding, foreign_key: true
      t.belongs_to :circulation, foreign_key: true

      t.timestamps
    end
  end
end
