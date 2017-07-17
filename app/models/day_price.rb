class DayPrice < ApplicationRecord
  belongs_to :unit, inverse_of: :day_prices
end
