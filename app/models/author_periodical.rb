class AuthorPeriodical < ApplicationRecord
  belongs_to :author
  belongs_to :periodical
end
