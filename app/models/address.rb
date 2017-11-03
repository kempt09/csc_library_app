class Address < ApplicationRecord
  has_one :customer_address
  has_one :customer, through: :customer_address

  validates :street, :city, :state, :zip, :country, :customer_id, :admin_id, presence: true

  before_create :add_user

  private

    def add_user
      if Customer.where(id: self.customer_id, :admin_id => self.admin_id).count > 0
        self.customer = Customer.find_by(id: self.customer_id, :admin_id => self.admin_id)
      else
        self.errors.add(:customer_id, 'User Does Not Exist')
        throw :abort
      end
    end

end
