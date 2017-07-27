class CommunityUserSerializer < ApplicationSerializer
  has_one :user

  attributes :id, :expiration_dt

end
