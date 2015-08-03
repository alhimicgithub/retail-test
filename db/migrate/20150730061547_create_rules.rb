class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.float :product_number
      t.string :condition
      t.references :product, index: true, foreign_key: true
      t.float :value
      t.string :measurment

      t.timestamps null: false
    end
  end
end
