class Inquiry < ApplicationRecord
  belongs_to :unit, inverse_of: :inquiries

  # after_initialize :price, unless: :persisted?
  # after_initialize :taxes_withheld, unless: :persisted?
  #
  # def self.calculate_price
  #   # if person makes reservation on dates found within Unit.first.day_prices use that value
  #   # else use avg cost value
  #   # unit nightly cost * days rented
  #
  # end
  #
  # def self.calculate_price_taxes_withheld
  #   # unit nightly cost * tax rate * days rented
  # end

end
