class Vendor < ActiveRecord::Base
	has_secure_password
	has_many :favorite_vendors
	has_many :users, through: :favorite_vendors
	has_many :deals

  def send_followers_sms
    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    @client = Twilio::REST::Client.new acct_sid, auth_token
    from = '+12055442814'
    followers = {'+16033400606' => 'Lowell'}
    followers.each do |num, name|
      message = @client.account.messages.create(
        :from => from,
        :to => num,
        :body => "Hey, #{name} new deals avaiable!"
        )
    end
  end

end