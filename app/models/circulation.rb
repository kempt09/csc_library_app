class Circulation < ApplicationRecord
  include ActiveRecord::Dirty
  has_one :author_circulation
  has_one :author, through: :author_circulation

  has_one :publisher_circulation
  has_one :publisher, through: :publisher_circulation

  has_many :circulation_log_entries
  has_many :log_entries, through: :circulation_log_entries

  validates :title, :cost, :admin_id, presence: true

  before_save :add_relationships

  def available?
    records = LogEntry.where(:circulation_id => self.id, :admin_id => self.admin_id, :checkin_dt => nil).count
    if records > 0
      false
    else
      true
    end
  end

  private

    def add_relationships
      if self.author_id_changed?
        self.author = Author.find_by(:admin_id => self.admin_id, id: self.author_id)
      end
      if self.publisher_id_changed?
        self.publisher = Publisher.find_by(:admin_id => self.admin_id, id: self.publisher_id)
      end
    end

end
