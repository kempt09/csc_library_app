class Holding < ApplicationRecord
  has_many :holding_log_entries
  has_many :log_entries, through: :holding_log_entries

  has_many :holding_circulations
  has_many :circulations, through: :holding_circulations

  has_many :holding_periodicals
  has_many :periodicals, through: :holding_periodicals

  has_many :holding_references
  has_many :references, through: :holding_references

  validates :title, presence: true, uniqueness: true
  validates :section, presence: true, :inclusion => { :in => ['CIR', 'REF', 'PER'] }

  def find_item(id)
    case self.section
      when 'REF'
        Reference.find(id)
      when 'PER'
        Periodical.find(id)
      when 'CIR'
        Circulation.find(id)
      else
        raise 'Item Not Found'
    end
  end

end
