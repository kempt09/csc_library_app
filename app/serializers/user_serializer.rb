class UserSerializer < ApplicationSerializer
  attributes :id, :first_name, :last_name, :email, :phone, :active, :token, :hashed_password
end
