class AddDefaultValueToCheckoutProductValue < ActiveRecord::Migration
  def up
    change_column :checkout_products, :value, :float, :default => 1.0
  end

  def down
    change_column :checkout_products, :value, :float, :default => nil
  end
end
