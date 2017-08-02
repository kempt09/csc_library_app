class AddActiveToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :periodicals, :active, :boolean, default: true
    add_column :circulations, :active, :boolean, default: true
    add_column :references, :active, :boolean, default: true
    add_column :authors, :active, :boolean, default: true
    add_column :publishers, :active, :boolean, default: true
    add_column :log_entries, :active, :boolean, default: true
    add_column :addresses, :active, :boolean, default: true
    add_column :community_users, :active, :boolean, default: true
    add_column :students, :active, :boolean, default: true
    add_column :staffs, :active, :boolean, default: true
    add_column :holdings, :active, :boolean, default: true
  end
end
