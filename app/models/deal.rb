class Deal < ActiveRecord::Base
	belongs_to :vendor
	has_many :purchased_items
	has_many :users, through: :purchased_items
end
