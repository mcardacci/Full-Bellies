class CreateFavoriteVendors < ActiveRecord::Migration
  def change
    create_table :favorite_vendors do |t|
    	t.references :user
    	t.references :vendor
    	
      t.timestamps null: false
    end
  end
end
