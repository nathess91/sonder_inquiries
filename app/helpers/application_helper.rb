module ApplicationHelper

  def get_avg_price(unit_id)
    unit = Unit.find(unit_id)
    all_unit_prices = DayPrice.pluck(:price, :unit_id)

    unit_prices = all_unit_prices.select { |price, unit| unit == unit }

    one_unit_prices = unit_prices.each { |price| price.pop() }

    result_prices = one_unit_prices.flatten

    return (result_prices.inject{ |sum, el| sum + el }.to_f / result_prices.size).ceil

  end

end
