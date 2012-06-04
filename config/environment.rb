# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sissichan2012::Application.initialize!

Rails::Initializer.run do |config|
  # configure action_mailer
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => 'mail.sissichan.com',
    :port => 587,
    :domain => 'sissichan.com',
    :authentication => :login,
    :user_name => 'sissichan@sissichan.com',
    :password => ''
  }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_charset = 'utf-8'
end
