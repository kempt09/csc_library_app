class Circulation < ApplicationRecord
  has_one :holding_circulation
  has_one :holding, through: :holding_circulation

  has_many :author_circulations
  has_many :authors, through: :author_circulations, before_add: :validate_limit

  has_one :publisher_circulation
  has_one :publisher, through: :publisher_circulation

  validates :title, :cost, :holding_id, presence: true

  after_create :add_holding
  before_save :add_publisher

  def available?
    records = LogEntry.where(:holding_id => self.holding_id, :item_id => self.id, :checkin_dt => nil).count
    if records > 0
      false
    else
      true
    end
  end

  private

    def validate_limit
      raise Exception.new if self.authors.size >= 3
    end

    def add_holding
      self.holding = Holding.where(id: self.holding_id).first
    end

    def add_publisher
      if self.publisher_id != nil
        self.publisher = Publisher.where(id: self.publisher_id).first
      else
        self.publisher = nil
      end
    end

end
