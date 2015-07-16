class CreatePurchasedItems < ActiveRecord::Migration
  def change
    create_table :purchased_items do |t|
      t.references :deal
      t.references :user
      t.integer	   :quantity
      t.decimal 	:price, precision: 5, scale: 2
      t.string 		:title
      t.string 		:description
      
      t.timestamps null: false
    end
  end
end
