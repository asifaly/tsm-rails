class CreateBaseProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :base_products do |t|
      t.string :description

      t.timestamps
    end
  end
end
