class CreateDayPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :day_prices do |t|
      t.date :date
      t.decimal :price, :precision => 8, :scale => 2
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
