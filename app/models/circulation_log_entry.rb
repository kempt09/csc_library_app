class CirculationLogEntry < ApplicationRecord
  belongs_to :circulation
  belongs_to :log_entry
end
