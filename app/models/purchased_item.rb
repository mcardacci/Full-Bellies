class PurchasedItem < ActiveRecord::Base
	belongs_to :deal
	belongs_to :user
end
