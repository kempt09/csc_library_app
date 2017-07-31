class CommunityUser < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  before_validation :default_expiration
  after_create :update_user

  private

    def default_expiration
      self.expiration_dt = self.expiration_dt != nil ? self.expiration_dt : Date.today + 1.year
    end

    def update_user
      user = User.where(id: self.user_id).first
      user.update(:user_type => 'COM')
    end

end
