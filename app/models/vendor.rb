class Vendor < ActiveRecord::Base

  include Messenger

	has_secure_password
	has_many :favorite_vendors
	has_many :users, through: :favorite_vendors
  has_many :followers, through: :favorite_vendors, source: :user
	has_many :deals

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates_confirmation_of :password


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.post_back(code)
    client_id = ENV['STRIPE_CLIENT_ID']
    secret = ENV['STRIP_SECRET_KEY']
    uri = URI("https://connect.stripe.com/oauth/token?client_secret=#{secret}&code=#{code}&grant_type=authorization_code")
    res = Net::HTTP.post_form(uri, 'q' => 'ruby')
    return res
  end

end
