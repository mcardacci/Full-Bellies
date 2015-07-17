class User < ActiveRecord::Base
	has_secure_password
	has_many :purchased_items
	has_many :deals, through: :purchased_items
	has_many :favorite_vendors
	has_many :favorites, through: :favorite_vendors, source: :vendor

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

end
