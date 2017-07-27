class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :apt
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false, default: 'US'
      t.string :zip, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
