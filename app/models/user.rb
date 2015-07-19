class User < ActiveRecord::Base
	has_secure_password
	has_many :purchased_items
	has_many :deals, through: :purchased_items
	has_many :favorite_vendors
	has_many :favorites, through: :favorite_vendors, source: :vendor

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
