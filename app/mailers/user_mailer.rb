class UserMailer < ApplicationMailer

  default from: 'lowell.mower@gmail.com'
  def welcome_email(users)
    users.each do |user|
      @user = user
      @url  = 'https://afternoon-meadow-3523.herokuapp.com/'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  end
end
