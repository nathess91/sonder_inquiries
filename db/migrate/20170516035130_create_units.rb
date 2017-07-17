class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :ad_name
      t.decimal :tax_percent, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
