class CreatePublisherCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :publisher_circulations do |t|
      t.belongs_to :publisher, foreign_key: true
      t.belongs_to :circulation, foreign_key: true

      t.timestamps
    end
  end
end
