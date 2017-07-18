class Unit < ApplicationRecord
  has_many :day_prices, inverse_of: :unit
  has_many :inquiries, inverse_of: :unit
end
