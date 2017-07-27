class Reference < ApplicationRecord
  has_many :author_references
  has_many :authors, through: :author_references

  has_one :holding_reference
  has_one :holding, through: :holding_reference

  has_one :publisher_reference
  has_one :publisher, through: :publisher_reference

  validates :title, :subtitle, :holding_id, presence: true

  after_create :add_holding
  before_save :add_publisher, if: publisher_id_changed?

  private

  def add_holding
    self.holding = Holding.where(id: self.holding_id).first
  end

  def add_publisher
    if self.publisher_id != nil
      self.publisher = Publisher.where(id: self.publisher_id).first
    end
  end

end
