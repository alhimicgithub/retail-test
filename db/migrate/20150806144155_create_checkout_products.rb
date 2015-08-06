class CreateCheckoutProducts < ActiveRecord::Migration
  def change
    create_table :checkout_products do |t|
      t.references :checkout, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.float :value

      t.timestamps null: false
    end
  end
end
