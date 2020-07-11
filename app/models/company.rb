class Company < ApplicationRecord
  has_rich_text :description
  before_save :set_city_state
  validates :email, email: true, unless: -> { email.blank? }

  def set_city_state
    zip_code_hash = ZipCodes.identify(zip_code)
    self.city = zip_code_hash[:city]
    self.state = zip_code_hash[:state_name]
  end
end
