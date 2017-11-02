class CirculationSerializer < ApplicationSerializer
  has_one :author
  has_one :publisher
  has_many :log_entries

  attributes :id, :title, :subtitle, :cost, :author_id, :publisher_id, :created_at, :updated_at
end
