class AuthorReference < ApplicationRecord
  belongs_to :author
  belongs_to :reference
end
