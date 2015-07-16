class Vendor < ActiveRecord::Base
	has_many :favorite_vendors
	has_many :users, through: :favorite_vendors
	has_many :deals
end
