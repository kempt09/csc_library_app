class LogEntrySerializer < ApplicationSerializer
  has_one :customer
  has_one :circulation

  attributes :id, :customer_id, :circulation_id, :checkout_dt, :checkin_dt, :due_dt, :created_at, :updated_at
end
