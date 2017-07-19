# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mtl_unit = Unit.where(ad_name: "Montreal Beauty").first_or_create(ad_name: "Montreal Beauty", tax_percent: 0.20)
sfo_unit = Unit.where(ad_name: "San Francisco Special").first_or_create(ad_name: "San Francisco Special", tax_percent: 0.19)

treehouse = Unit.where(ad_name: "Tarzan's Treehouse").first_or_create(ad_name: "Tarzan's Treehouse", tax_percent: 0.18)
tardis = Unit.where(ad_name: "TARDIS").first_or_create(ad_name: "TARDIS", tax_percent: 0.17)
drac = Unit.where(ad_name: "Dracula's Castle").first_or_create(ad_name: "Dracula's Castle", tax_percent: 0.10)
vers = Unit.where(ad_name: "Versailles").first_or_create(ad_name: "Versailles", tax_percent: 0.22)


Date.current.upto(10.days.from_now.to_date) do |date|
  DayPrice.create(unit: mtl_unit, date: date, price: (100 + 20*rand).round(2))
  DayPrice.create(unit: sfo_unit, date: date, price: (200 + 20*rand).round(2))
  DayPrice.create(unit: treehouse, date: date, price: (100 + 20*rand).round(2))
  DayPrice.create(unit: tardis, date: date, price: (500 + 20*rand).round(2))
  DayPrice.create(unit: drac, date: date, price: (200 + 20*rand).round(2))
  DayPrice.create(unit: vers, date: date, price: (300 + 20*rand).round(2))
end
