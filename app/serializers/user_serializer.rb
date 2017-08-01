class UserSerializer < ApplicationSerializer
  has_one :address
  has_one :staff
  has_one :student
  has_one :community_user
  has_many :log_entries

  attributes :id, :first_name, :last_name, :email, :phone, :active, :token, :hashed_password, :created_at, :updated_at, :user_type, :full_name
end
