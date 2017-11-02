class Author < ApplicationRecord
  has_many :author_circulations
  has_many :circulations, through: :author_circulations

  validates :first_name, :last_name, :name, :admin_id, presence: true

  before_save :compute_name

  private

  def compute_name
    self.name = "#{self.first_name} #{self.last_name}".downcase
  end

end
