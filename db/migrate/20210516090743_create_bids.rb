class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.decimal :bid_amount, precision: 14, scale: 2
      t.references :bid_status, null: false, foreign_key: true
      t.references :base_rate, null: true, foreign_key: true
      t.decimal :rate, precision: 4, scale: 2
      t.decimal :spread, precision: 4, scale: 2
      t.datetime :bid_validity

      t.timestamps
    end
  end
end
