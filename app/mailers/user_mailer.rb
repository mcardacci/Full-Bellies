class UserMailer < ApplicationMailer

  default from: 'fullbellies@example.com'

  def email_followers(user_emails)
    @url  = 'https://afternoon-meadow-3523.herokuapp.com/'
    mail(to: user_emails, subject: 'Welcome to My Awesome Site')
  end
end
