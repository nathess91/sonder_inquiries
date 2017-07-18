class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.references :unit, foreign_key: true
      t.string :rental_site
      t.decimal :taxes_withheld
      t.decimal :price
      t.string :phone_number
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :arrival_date
      t.date :departure_date

      t.timestamps
    end
  end
end
