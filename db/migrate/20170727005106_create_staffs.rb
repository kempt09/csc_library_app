class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :rank, null: false
      t.integer :role, null: false, default: 2
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
