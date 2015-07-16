class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, uniqueness: true
      t.string :username, null: false, uniqueness: true
      t.string :password_digest, null: false
      t.string :phone_number
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
