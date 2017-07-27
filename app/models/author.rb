class Author < ApplicationRecord
  has_many :author_circulations
  has_many :circulations, through: :author_circulations

  has_many :author_periodicals
  has_many :periodicals, through: :author_periodicals

  has_many :author_references
  has_many :references, through: :author_references

  validates :first_name, :last_name, presence: true

end
