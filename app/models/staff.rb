class Staff < ApplicationRecord
  belongs_to :user

  validates :rank, :role, presence: true
  validates :user_id, uniqueness: true

  enum role: [:super_admin, :admin, :worker]

end
