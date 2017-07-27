class StudentSerializer < ApplicationSerializer
  has_one :user

  attributes :id, :class, :major, :minor, :user_id, :created_at, :updated_at
end
