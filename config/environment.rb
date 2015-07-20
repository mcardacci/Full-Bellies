# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SEND_GRID_USERNAME'],
  :password => ENV['SEND_GRID_PASS'],
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


# Initialize the Rails application.
Rails.application.initialize!
# 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