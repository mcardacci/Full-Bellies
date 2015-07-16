class User < ActiveRecord::Base
	has_many :purchased_items
	has_many :deals, through: :purchased_items
	has_many :favorite_vendors
	has_many :favorited_vendors, through: :favorite_vendors, class_name: "Vendor" 
end
