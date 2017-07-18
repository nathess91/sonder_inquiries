module InquiriesHelper

  def total_nights_rented(inquiry_id)
    inquiry = Inquiry.find_by_id(inquiry_id)

    (inquiry.departure_date - inquiry.arrival_date).to_i
  end

  def calculate_total_price(inquiry_id, unit_id)
    inquiry = Inquiry.find_by_id(inquiry_id)
    day_prices = Unit.find_by_id(unit_id).day_prices.pluck(:date, :price)
    total_price = 0

    day_prices.each do |date, price|
      if (inquiry.arrival_date...inquiry.departure_date).cover?(date)
        total_price += price
      else
        total_price = get_avg_price(unit_id) * total_nights_rented(inquiry_id)
      end
    end

    return total_price.to_f

  end

  def calculate_taxes(inquiry_id, unit_id)
    unit_tax_rate = Unit.find_by_id(unit_id).tax_percent
    (calculate_total_price(inquiry_id, unit_id) * unit_tax_rate).to_f
  end

end # end InquiriesHelper
