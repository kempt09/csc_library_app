class CreateHoldingPeriodicals < ActiveRecord::Migration[5.1]
  def change
    create_table :holding_periodicals do |t|
      t.belongs_to :holding, foreign_key: true
      t.belongs_to :periodical, foreign_key: true

      t.timestamps
    end
  end
end
