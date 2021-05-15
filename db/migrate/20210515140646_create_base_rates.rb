class CreateBaseRates < ActiveRecord::Migration[6.1]
  def change
    create_table :base_rates do |t|
      t.string :description

      t.timestamps
    end
  end
end
