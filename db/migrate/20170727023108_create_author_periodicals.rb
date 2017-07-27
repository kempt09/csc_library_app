class CreateAuthorPeriodicals < ActiveRecord::Migration[5.1]
  def change
    create_table :author_periodicals do |t|
      t.belongs_to :author, foreign_key: true
      t.belongs_to :periodical, foreign_key: true

      t.timestamps
    end
  end
end
