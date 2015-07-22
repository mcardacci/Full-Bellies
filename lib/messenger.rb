module Messenger

  def send_sms(deal)
    acct_sid = ENV['TWILIO_ACCT_SID']
    auth_token = ENV['TWILIO_AUTH']

    @deal = deal
    @vendor = Vendor.find(deal.vendor_id)
    @phones = parse_numbers(@vendor.followers.pluck(:phone_number))
    @names = @vendor.followers.pluck(:username)
    @client = Twilio::REST::Client.new acct_sid, auth_token
    from = '+12055442814'
    @phones.each do |num|
      message = @client.account.messages.create(
        :from => from,
        :to => '+1'+num,
        :body => "Ahoy! #{@vendor.name} just posted they have #{@deal.title}! Visit the url below to purchase. www.fullbellies.com/deals/#{@deal.id}"
        )
    end
  end

  def parse_numbers(phone_array)
    phone_array.delete_if{|x| x == nil}
    phone_array.map! {|x| x.scan(/\d+/).join }.delete_if{|x| x.length < 10  }
    return phone_array
  end

end
