class PublisherSerializer < ApplicationSerializer
  has_many :circulations

  attributes :id, :name, :created_at, :updated_at
end
