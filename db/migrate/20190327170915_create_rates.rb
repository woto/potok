class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :from_currency
      t.integer :to_currency
      t.decimal :buy, precision: 24, scale: 12 
      t.decimal :sell, precision: 24, scale: 12 
      t.date :receive_date

      t.timestamps
    end
  end
end
