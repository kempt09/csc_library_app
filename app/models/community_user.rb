class CommunityUser < ApplicationRecord
  belongs_to :user

  validates :expiration_dt, :user_id, presence: true
  before_create :default_expiration

  private

    def default_expiration
      self.expiration_dt == nil ? self.expiration_dt : Date.today + 1.year
    end

end
