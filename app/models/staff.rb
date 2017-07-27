class Staff < ApplicationRecord
  belongs_to :user

  validates :rank, :role, presence: true
  validates :user_id, uniqueness: true

  enum role: [:super_admin, :admin, :worker]

  after_save :add_user

  private

    def add_user
      self.user = User.where(id: self.user_id).first
    end
end
