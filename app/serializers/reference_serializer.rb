class ReferenceSerializer < ApplicationSerializer
  has_many :authors
  has_one :publisher
  has_one :holding

  attributes :id, :title, :subtitle, :publisher_id, :holding_id, :created_at, :updated_at, :active
end
