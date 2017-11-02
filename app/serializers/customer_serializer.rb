class CustomerSerializer < ApplicationSerializer
  has_many :addresses
  has_many :log_entries

  attributes :id, :first_name, :last_name, :email, :phone, :notes
end
