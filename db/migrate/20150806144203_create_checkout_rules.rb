class CreateCheckoutRules < ActiveRecord::Migration
  def change
    create_table :checkout_rules do |t|
      t.references :checkout, index: true, foreign_key: true
      t.references :rule, index: true, foreign_key: true
      t.float :discount_value

      t.timestamps null: false
    end
  end
end
