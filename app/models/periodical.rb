class Periodical < ApplicationRecord
  has_many :author_periodicals
  has_many :author, through: :author_periodicals

  has_one :holding_periodical
  has_one :holding, through: :holding_periodical

  has_one :publisher_periodical
  has_one :publisher, through: :publisher_periodical

  validates :title, :volume, :volume_no, :holding_id, presence: true

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
