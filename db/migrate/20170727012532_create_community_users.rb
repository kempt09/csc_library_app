class CreateCommunityUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :community_users do |t|
      t.datetime :expiration_dt, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
