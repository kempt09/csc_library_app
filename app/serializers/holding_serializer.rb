class HoldingSerializer < ApplicationSerializer
  has_many :log_entries
  has_many :circulations
  has_many :periodicals
  has_many :references

  attributes :id, :title, :section, :created_at, :updated_at, :active
end
