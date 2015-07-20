class UserMailer < ApplicationMailer

  default from: 'fullbellies@example.com'

  def email_vendor(deal, purchase)
    @deal = deal
    @user = User.find(purchase.user_id)
    @vendor = Vendor.find(deal.vendor_id)
    email = @vendor.email
    @url  = 'https://afternoon-meadow-3523.herokuapp.com/'
    mail(to: email, subject: "Ahoy, #{@vendor.name}! There's been a purhase")
  end

  def email_followers(deal)
    @vendor = Vendor.find(deal.vendor_id)
    user_emails = @vendor.followers.pluck(:email)
    @deal = deal
    @url  = 'https://afternoon-meadow-3523.herokuapp.com/'
    mail(to: user_emails, subject: "New Deals from #{@vendor.name}")
  end
end
