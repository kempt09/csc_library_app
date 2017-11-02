class AuthorSerializer < ApplicationSerializer
  has_many :circulations

  attributes :id, :first_name, :last_name, :created_at, :updated_at
end
