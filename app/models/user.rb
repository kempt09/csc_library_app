class User < ApplicationRecord
  include BCrypt
  validates :first_name, :last_name, :user_type, presence: true
  validates :user_type, presence: true, :inclusion => { :in => ['STU', 'STA', 'COM'] }
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :phone, presence: true, uniqueness: true, format: /\A\d{10}\z/

  before_create :init_user
  before_save :format_attrs_on_save
  after_create :send_password, :update_token
  before_destroy :clean_up

  has_many :user_log_entries
  has_many :log_entries, through: :user_log_entries
  has_one :student
  has_one :community_user
  has_one :staff
  has_one :address

  def hash_password(password)
    self.hashed_password = Password.create(password)
    self.save!
  end

  def send_password
    password = SecureRandom.base64(8)
    self.hashed_password = Password.create(password)
    if self.save
      UserMailer.send_password(self.email, password, self.first_name).deliver_now
    else
      raise 'Error Sending Password'
    end
  end

  def update_token
    secret = Rails.application.secrets[:secret_key_base]
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

  def overdue_books?
    start_dt = Time.now - 1.years
    end_dt = Time.now
    records = LogEntry.where(:user_id => self.id, :checkin_dt => nil, :due_dt => start_dt..end_dt).count
    if records > 0
      true
    else
      false
    end
  end

  def create_checkout(item)

    if self.overdue_books?
      raise 'Overdue Books: Not Allowed To Check Out'
    end

    due_dt = item.holding.section != 'CIR' ? Time.now + 4.hours : Time.now + 2.weeks

    if item.holding.section == 'PER'
      records = LogEntry.where(:holding_id => item.holding_id, :item_id => item.id, :checkin_dt => nil).count
      if records >= 5
        raise 'Max Periodicals Reached'
      end

    end

    if item.holding.section == 'REF'
      records = LogEntry.where(:holding_id => item.holding_id, :item_id => item.id, :checkin_dt => nil).count
      if records >= 3
        raise 'Max References Reached'
      end

    end

    LogEntry.create(
      :user_id => self.id,
      :holding_id => item[:holding_id],
      :item_id => item[:id],
      :checkout_dt => Time.now,
      :checkin_dt => nil,
      :due_dt => due_dt
    )

  end

  def create_checkin(item)
    log_entry = LogEntry.where(:user_id =>  self.id, :holding_id => item[:holding_id], :item_id => item[:id], :checkin_dt => nil).first
    if log_entry != nil
      log_entry.update(:checkin_dt => Time.now)
    else
      raise 'No Log Exists For This Book'
    end
  end

  private

  def format_attrs_on_save
    self.email.gsub!(' ', '')
    self.phone.gsub!(' ', '')
    self.first_name.gsub!(' ', '')
    self.last_name.gsub!(' ', '')
    self.full_name = "#{self.first_name} #{self.last_name}".downcase
  end

  def init_user
    self.token = SecureRandom.uuid
    self.hashed_password = SecureRandom.uuid
  end

  def clean_up
    if self.student?
      self.student.destroy
    end
    if self.staff?
      self.staff.destroy
    end
    if self.community_user?
      self.community_user.destroy
    end
    if self.address?
      self.address.destroy
    end
    self.log_entries.each do |log|
      log.destroy
    end
  end
end
