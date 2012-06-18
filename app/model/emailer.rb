require 'yaml'

class Emailer < ActionMailer::Base
  sysvar = YAML::load(File.open("#{Rails.root}/config/sysvar.yml"))

  default :to => sysvar[ENV['CONFIG_ENV']]['email']

  def contact(name, email, subject, message, eventDate)
    @message = message
    @eventDate = eventDate
    @name = name
    @email = email

    mail(:subject => subject,
         :from => email)
  end
end
