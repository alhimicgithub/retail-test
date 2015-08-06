class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :number

      t.timestamps null: false
    end
  end
end
