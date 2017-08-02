class CommunityUserSerializer < ApplicationSerializer
  has_one :user

  attributes :id, :expiration_dt, :user_id, :created_at, :updated_at, :active

end
