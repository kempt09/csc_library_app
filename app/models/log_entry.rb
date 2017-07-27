class LogEntry < ApplicationRecord
  has_one :user_log_entry
  has_one :user, through: :user_log_entry

  has_one :holding_log_entry
  has_one :holding, through: :holding_log_entry

  def holding_item
    if self.holding.section == 'REF'
      Reference.where(id: self.item_id).first
    elsif self.holding.section == 'PER'
      Periodical.where(id: self.item_id).first
    else
      Circulation.where(id: self.item_id).first
    end
  end

  after_save :add_relationships

  private

    def add_relationships
      self.user = User.where(id: self.user_id).first
      self.holding = Holding.where(id: self.holding_id).first
    end

end
