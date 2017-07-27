class HoldingLogEntry < ApplicationRecord
  belongs_to :holding
  belongs_to :log_entry
end
