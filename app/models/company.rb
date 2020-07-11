class Company < ApplicationRecord
  has_rich_text :description
  validates :email, email: true, unless: -> { email.blank? }
end
