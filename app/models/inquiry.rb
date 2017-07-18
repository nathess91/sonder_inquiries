class Inquiry < ApplicationRecord
  belongs_to :unit, inverse_of: :inquiries

  validates :first_name, :last_name, :arrival_date, :departure_date, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  attr_accessor :get_avg_price, :total_nights_rented, :calculate_total_price, :calculate_taxes
  after_save :calculate_total_price, :calculate_taxes

  def get_avg_price
    unit = Unit.find(self.unit_id)

    if unit.day_prices.count > 0
      prices = unit.day_prices.pluck(:price)
      return (prices.inject{ |sum, amt| sum + amt }.to_f / prices.size).ceil
    end

  end

  def total_nights_rented
    inquiry = Inquiry.find(self.id)

    (self.departure_date - self.arrival_date).to_i
  end

  def calculate_total_price
    inquiry = Inquiry.find(self.id)
    day_prices = Unit.find(self.unit_id).day_prices.pluck(:date, :price)
    total_price = 0

    day_prices.each do |date, price|
      if (inquiry.arrival_date...inquiry.departure_date).cover?(date)
        total_price += price
      else
        total_price = self.get_avg_price * self.total_nights_rented
      end
    end

    self.update_attribute(:price, total_price.to_f)

  end

  def calculate_taxes
    unit_tax_rate = Unit.find(self.unit_id).tax_percent
    taxes = (self.price * unit_tax_rate).to_f

    self.update_attribute(:taxes_withheld, taxes)
  end

end
