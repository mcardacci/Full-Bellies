class AddColumnsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :access_token, :string
    add_column :vendors, :livemode, :boolean
    add_column :vendors, :refresh_token, :string
    add_column :vendors, :token_type, :string
    add_column :vendors, :stripe_publishable_key, :string
    add_column :vendors, :stripe_user_id, :string
    add_column :vendors, :scope, :string
  end
end
