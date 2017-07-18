module ApplicationHelper

  include Inquiry::InquiriesHelper

  def get_avg_price(unit_id)
    unit = Unit.find_by_id(unit_id)

    if unit.day_prices.count > 0
      prices = unit.day_prices.pluck(:price)
      return (prices.inject{ |sum, amt| sum + amt }.to_f / prices.size).ceil
    end

  end

end
