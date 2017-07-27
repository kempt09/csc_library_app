class Circulation < ApplicationRecord
  has_one :holding_circulation
  has_one :holding, through: :holding_circulation

  has_many :author_circulations
  has_many :authors, through: :author_circulations

  has_one :publisher_circulation
  has_one :publisher, through: :publisher_circulation

  validates :title, :cost, :holding_id, presence: true

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
