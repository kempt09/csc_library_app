class LogEntry < ApplicationRecord
  has_one :customer_log_entry
  has_one :customer, through: :customer_log_entry

  has_one :circulation_log_entry
  has_one :circulation, through: :circulation_log_entry

  validates :customer_id, :circulation_id, :admin_id, presence: true

  before_create :add_relationships

  private

    def add_relationships
      self.customer = Customer.find_by(id: self.customer_id, :admin_id => self.admin_id)
      self.circulation = Circulation.find_by(id: self.circulation_id, :admin_id => self.admin_id)
    end

end
