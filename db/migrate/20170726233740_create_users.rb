class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, index: true
      t.string :last_name, null: false, index: true
      t.string :email, null: false
      t.string :token, null: false
      t.string :hashed_password, null: false
      t.timestamps
    end
  end
end
