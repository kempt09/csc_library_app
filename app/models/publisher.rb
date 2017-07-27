class Publisher < ApplicationRecord
  has_many :publisher_circulations
  has_many :circulations, through: :publisher_circulations

  has_many :publisher_periodicals
  has_many :periodicals, through: :publisher_periodicals

  has_many :publisher_references
  has_many :references, through: :publisher_references

  validates :name, presence: true, uniqueness: true
end
