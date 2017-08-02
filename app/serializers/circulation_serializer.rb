class CirculationSerializer < ApplicationSerializer
  has_many :authors
  has_one :publisher
  has_one :holding

  attributes :id, :title, :subtitle, :cost, :holding_id, :publisher_id, :created_at, :updated_at, :active
end
