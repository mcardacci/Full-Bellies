class Deal < ActiveRecord::Base
	belongs_to :vendor
	has_many :purchased_items
	has_many :users, through: :purchased_items
  validates :title, presence: true
  validates :description, presence: true
  validates :item_quantity, presence: true
  validates :item_price, presence: true
end
