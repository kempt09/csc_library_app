class CreatePublisherCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :publisher_circulations do |t|
      t.belongs_to :publisher, index: true
      t.belongs_to :circulation, index: true
      t.timestamps
    end
  end
end
