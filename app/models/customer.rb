class Customer < ApplicationRecord
  has_many :customer_addresses
  has_many :addresses, through: :customer_addresses

  has_many :customer_log_entries
  has_many :log_entries, through: :customer_log_entries

  validates :first_name, :last_name, presence: true

  before_save :compute_name
  before_destroy :clean

  def create_checkout(item)

    due_dt = Time.now + 2.weeks

    LogEntry.create(
      :customer_id => self.id,
      :admin_id => self.admin_id,
      :circulation_id => item[:id],
      :checkout_dt => Time.now,
      :checkin_dt => nil,
      :due_dt => due_dt
    )

  end

  def create_checkin(item)

    log_entry = LogEntry.where(
      :customer_id =>  self.id,
      :circulation_id => item[:id],
      :admin_id => self.admin_id,
      :checkin_dt => nil
    ).first

    if log_entry != nil
      log_entry.update(:checkin_dt => Time.now)
    else
      raise 'No Log Exists For This Book'
    end

  end

  private

  def compute_name
    self.name = "#{self.first_name} #{self.last_name}".downcase
  end

  def clean
    self.addresses.each do |record|
      record.destroy
    end
    self.log_entries.each do |record|
      record.destroy
    end
  end
end
