class StaffSerializer < ApplicationSerializer
  has_one :user

  attributes :id, :rank, :role, :user_id, :created_at, :updated_at, :active
end
