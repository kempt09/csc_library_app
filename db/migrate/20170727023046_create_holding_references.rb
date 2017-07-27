class CreateHoldingReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :holding_references do |t|
      t.belongs_to :holding, foreign_key: true
      t.belongs_to :reference, foreign_key: true

      t.timestamps
    end
  end
end
