class Staff < ApplicationRecord
  belongs_to :user

  validates :rank, :role, presence: true
  validates :user_id, uniqueness: true

  enum role: [:super_admin, :admin, :worker]

  after_create :update_user

  private

    def update_user
      user = User.where(id: self.user_id, :active => true).first
      user.update(:user_type => 'STA')
    end


end
