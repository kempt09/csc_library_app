class AuthorCirculation < ApplicationRecord
  belongs_to :author
  belongs_to :circulation
end
