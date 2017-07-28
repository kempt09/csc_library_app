class Student < ApplicationRecord
  belongs_to :user

  validates :student_class, presence: true, :inclusion => { :in => [ 1, 2, 3, 4] }
  validates :user_id, presence: true, uniqueness: true

end
