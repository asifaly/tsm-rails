class AddEnumsToOffers < ActiveRecord::Migration[6.1]
  def up
    safety_assured do
      execute <<-SQL
      CREATE TYPE payment_types AS ENUM('payment', 'acceptance', 'deferred', 'negotiation');
      CREATE TYPE shipment_modes AS ENUM('sea', 'air', 'road', 'rail', 'multi');
      SQL
    end
    add_column :offers, :available_by, :payment_types
    add_column :offers, :shipment_mode, :shipment_modes
  end

  def down
    safety_assured do
      execute <<-SQL
      DROP_TYPE payment_types;
      DROP_TYPE shipment_modes;
      SQL
    end
    remove_column :offers, :available_by, :payment_types
    remove_column :offers, :shipment_mode, :shipment_modes
  end
end
