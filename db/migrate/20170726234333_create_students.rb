class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :class, null: false, default: 1
      t.string :major, null: false
      t.string :minor
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
