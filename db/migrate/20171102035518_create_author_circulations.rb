class CreateAuthorCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :author_circulations do |t|
      t.belongs_to :author, index: true
      t.belongs_to :circulation, index: true
      t.timestamps
    end
  end
end
