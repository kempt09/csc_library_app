class PeriodicalSerializer < ApplicationSerializer
  has_many :authors
  has_one :publisher
  has_one :holding

  attributes :id, :title, :volume, :volume_no, :holding_id, :publisher_id, :active
end
