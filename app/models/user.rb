class User < ActiveRecord::Base
	has_secure_password
	has_many :purchased_items
	has_many :deals, through: :purchased_items
	has_many :favorite_vendors
	has_many :favorites, through: :favorite_vendors, source: :vendor
end
