class AddressSerializer < ApplicationSerializer
  has_one :user

  attributes :id, :street, :apt, :city, :state, :country, :zip, :user_id, :created_at, :updated_at, :active
end
