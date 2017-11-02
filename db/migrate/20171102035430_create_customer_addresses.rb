class CreateCustomerAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_addresses do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :address, index: true
      t.timestamps
    end
  end
end
