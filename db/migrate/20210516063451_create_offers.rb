class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :account, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.decimal :transaction_amount, precision: 14, scale: 2
      t.decimal :percentage_sold, precision: 4, scale: 2
      t.boolean :disclosed
      t.boolean :open_offer
      t.decimal :risk_sold_amount, precision: 14, scale: 2
      t.decimal :rate, precision: 4, scale: 2
      t.references :base_rate, null: true, foreign_key: true
      t.decimal :spread, precision: 4, scale: 2
      t.datetime :valid_until
      t.date :expiry_date
      t.integer :tenor_days
      t.string :place_of_taking_incharge
      t.string :port_of_loading
      t.string :port_of_discharge
      t.string :final_destination
      t.string :status

      t.timestamps
    end
  end
end
