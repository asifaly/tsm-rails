class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.boolean :funded
      t.references :base_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
