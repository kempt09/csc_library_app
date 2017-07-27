class Address < ApplicationRecord
  belongs_to :user

  validates :street, :city, :state, :zip, :country, :user_id, presence: true
  validates :user_id, uniqueness: true

  after_create :add_user

  private

    def add_user
      self.user = User.where(id: self.user_id).first
    end

end
