class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, index: true
      t.string :last_name, null: false, index: true
      t.string :email, null: false, index: true
      t.string :phone, null: false, index: true
      t.string :token, null: false
      t.string :hashed_password, null: false
      t.string :user_type, null: false, default: 'STU'
      t.boolean :active, null: false, default: true
      t.timestamps
    end
  end
end
