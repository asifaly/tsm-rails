class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :code
      t.decimal :iso_code, precision: 3, scale: 0
      t.string :description

      t.timestamps
    end
  end
end
