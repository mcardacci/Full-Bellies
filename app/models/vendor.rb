class Vendor < ActiveRecord::Base
	has_secure_password
	has_many :favorite_vendors
	has_many :users, through: :favorite_vendors
  has_many :followers, through: :favorite_vendors, source: :user
	has_many :deals

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def send_followers_sms(deal)
    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]

    @deal = deal
    @vendor = Vendor.find(deal.vendor_id)
    @phones = parse_numbers(@vendor.followers.pluck(:phone_number))
    @names = @vendor.followers.pluck(:username)
    @client = Twilio::REST::Client.new acct_sid, auth_token
    from = '+12055442814'
    # followers = {'+16033400606' => 'Lowell'}
    @phones.each do |num|
      message = @client.account.messages.create(
        :from => from,
        :to => '+1'+num,
        :body => "Ahoy! #{@vendor.name} just posted they have #{@deal.title}! Click here to purchase."
        )
    end
  end

  def parse_numbers(phone_array)
    phone_array.delete_if{|x| x == nil}
    phone_array.map! {|x| x.scan(/\d+/).join }.delete_if{|x| x.length < 10  }
    return phone_array
  end

end
