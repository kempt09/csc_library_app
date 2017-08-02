class Staff < ApplicationRecord
  belongs_to :user

  validates :rank, :role, presence: true
  validates :user_id, uniqueness: true

  enum role: [:super_admin, :admin, :worker]

  after_create :update_user, :add_created_date
  before_save :add_updated_date

  private

    def add_create_date
      self.created_at = Time.now
    end

    def add_dates
      self.updated_at = Time.now
    end

    def update_user
      user = User.where(id: self.user_id).first
      user.update(:user_type => 'STA')
    end


end
