class Student < ApplicationRecord
  belongs_to :user

  validates :student_class, presence: true, :inclusion => { :in => [ 1, 2, 3, 4] }
  validates :user_id, presence: true, uniqueness: true

  after_create :update_user

  private

  def update_user
    user = User.where(id: self.user_id, :active => true).first
    user.update(:user_type => 'STU')
  end

end
