class CommunityUser < ApplicationRecord
  belongs_to :user

  validates :expiration_dt, presence: true
  before_create :default_expiration
  after_create :add_user

  private

    def default_expiration
      self.expiration_dt == nil ? self.expiration_dt : Date.today + 1.year
    end

    def add_user
      self.user = User.where(id: self.user_id).first
    end

end
