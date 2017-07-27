class HoldingCirculation < ApplicationRecord
  belongs_to :holding
  belongs_to :circulation
end
