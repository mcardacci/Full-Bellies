class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :vendor
      t.string :title, null: false
      t.string :description, null: false
      t.integer :item_quantity, null: false
      t.decimal :item_price, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
