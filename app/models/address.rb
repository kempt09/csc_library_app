class Address < ApplicationRecord
  has_one :customer_address
  has_one :customer, through: :customer_address

  validates :street, :city, :state, :zip, :country, :customer_id, :admin_id, presence: true
  validates :customer_id, uniqueness: true

  before_create :add_user

  private

    def add_user
      self.customer = Customer.find_by(id: self.customer_id, :admin_id => self.admin_id)
    end

end
