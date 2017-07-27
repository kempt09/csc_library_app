class UserLogEntry < ApplicationRecord
  belongs_to :user
  belongs_to :log_entry
end
