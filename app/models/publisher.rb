class Publisher < ApplicationRecord
  has_many :publisher_circulations
  has_many :circulations, through: :publisher_circulations
  validates :name, presence: true
end
