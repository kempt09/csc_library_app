class LogEntrySerializer < ApplicationSerializer
  has_one :user
  has_one :holding

  attributes :id, :user_id, :holding_id, :item_id, :checkout_dt, :checkin_dt, :due_dt, :created_at, :updated_at
end
