class CustomerLogEntry < ApplicationRecord
  belongs_to :customer
  belongs_to :log_entry
end
