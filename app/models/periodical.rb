class Periodical < ApplicationRecord
  has_many :author_periodicals
  has_many :authors, through: :author_periodicals, before_add: :validate_limit

  has_one :holding_periodical
  has_one :holding, through: :holding_periodical

  has_one :publisher_periodical
  has_one :publisher, through: :publisher_periodical

  validates :title, :volume, :volume_no, :holding_id, presence: true

  after_create :add_holding
  before_save :add_publisher, if: publisher_id_changed?

  def available?
    records = ActiveRecord::Base.connection.execute(
      "
        SELECT
          count(*)
        FROM
          log_entries
        WHERE
          log_entries.holding_id = #{self.holding_id} AND
          log_entries.item_id = #{self.id} AND
          log_entries.checkin_dt IS NULL
      "
    ).to_a
    if records[0]['count'] > 0
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
    end
  end

end
