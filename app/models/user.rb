class User < ApplicationRecord
  include BCrypt
  validates :first_name, :last_name, :user_type, presence: true
  validates :user_type, presence: true, :inclusion => { :in => ['STU', 'STA', 'COM'] }
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :phone, presence: true, uniqueness: true, format: /\A\d{10}\z/

  before_create :init_user
  before_save :format_attrs_on_save
  after_create :send_password, :update_token
  after_destroy :clean_up

  has_many :user_log_entries
  has_many :log_entries, through: :user_log_entries

  def send_password
    password = SecureRandom.base64(8)
    self.hashed_password = Password.create(password)
    if self.save
      UserMailer.send_password(self.email, password, self.first_name)
    end
  end

  def update_token
    self.hashed_password = Password.create(SecureRandom.base64(8))
    secret = Rails.secrets['secret_key_base']
    t = Time.now.utc + 5200000
    self.token = JWT.encode({email: self.email, exp: t.to_i}, secret)
    self.save
  end

  def student?
    self.student != nil ? true : false
  end

  def staff?
    self.staff != nil ? true : false
  end

  def community_user?
    self.community_user != nil ? true : false
  end

  def address?
    self.address != nil ? true : false
  end

  private

  def format_attrs_on_save
    self.email.gsub!(' ', '')
    self.phone.gsub!(' ', '')
    self.first_name.gsub!(' ', '')
    self.last_name.gsub!(' ', '')
  end

  def init_user
    self.token = SecureRandom.uuid
    self.hashed_password = SecureRandom.uuid
  end

  def clean_up
    if self.address?
      self.address.destroy
    end
    if self.student?
      self.student.destroy
    end
    if self.staff?
      self.staff.destroy
    end
    if self.community_user?
      self.community_user.destroy
    end
    self.log_entries.each do |log|
      log.destroy
    end
  end
end
