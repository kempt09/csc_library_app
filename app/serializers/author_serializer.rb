class AuthorSerializer < ApplicationSerializer
  has_many :circulations
  has_many :references
  has_many :periodicals

  attributes :id, :first_name, :last_name, :created_at, ;updated_at
end
