class User < ApplicationRecord
  include BCrypt

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, on: :create

  attr_accessor :password

  before_create :init_user
  before_save :format_attrs
  before_destroy :clean

  def update_token
    secret = Rails.application.secrets[:secret_key_base]
    t = Time.now.utc + 5200000
    self.token = JWT.encode({email: self.email, exp: t.to_i}, secret)
    self.save
  end

  private

  def init_user
    secret = Rails.application.secrets[:secret_key_base]
    t = Time.now.utc + 5200000
    self.token = JWT.encode({email: self.email, exp: t.to_i}, secret)
    self.hashed_password = Password.create(self.password)
  end

  def format_attrs
    self.email.gsub!(' ', '')
    self.email.downcase!
    self.first_name.gsub!(' ', '')
    self.last_name.gsub!(' ', '')
  end

  def clean
    Author.where(:admin_id => self.id).each do |record|
      record.destroy
    end
    Publisher.where(:admin_id => self.id).each do |record|
      record.destroy
    end
    Circulation.where(:admin_id => self.id).each do |record|
      record.destroy
    end
    Customer.where(:admin_id => self.id).each do |record|
      record.destroy
    end
    LogEntry.where(:admin_id => self.id).each do |record|
      record.destroy
    end
    Address.where(:admin_id => self.id).each do |record|
      record.destroy
    end
  end

end
