class AddressSerializer < ApplicationSerializer
  has_one :customer

  attributes :id, :street, :apt, :city, :state, :country, :zip, :customer_id, :created_at, :updated_at
end
