class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.text :bio	
      t.string :address, null: false
      t.integer :phone_num, null: false

      t.timestamps null: false
    end
  end
end
