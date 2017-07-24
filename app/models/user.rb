class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :phone, presence: true, uniqueness: true, format: /\A\d{10}\z/

  before_create :send_password, init_token

  private

  def send_password
    password = SecureRandom.base64(8)
    self.hashed_password = Password.create(password)
    ApplicationMailer.send_password(self.email, password)
  end

  def init_token
    JWT.
  end

end
