module InquiriesHelper

  def total_nights_rented(inquiry_id)
    inquiry = Inquiry.find_by_id(inquiry_id)

    (inquiry.departure_date - inquiry.arrival_date).to_i
  end

  def calculate_total_price(inquiry_id, unit_id)
    inquiry = Inquiry.find_by_id(inquiry_id)
    # get all in-between reservation dates
    inquiry_date_range = (inquiry.arrival_date..inquiry.departure_date).map(&:to_s)
    day_price_dates = Unit.find_by_id(unit_id).day_prices.pluck(:date, :price).map(&:to_s)

    day_price_dates.each do |date, price|
      if inquiry_date_range.include?(date)
        return price
      else
        puts "nope"
      end
    end

  end

end

# if person makes reservation on dates found within Unit.first.day_prices use that value
# else use avg cost value
# unit nightly cost * days rented
