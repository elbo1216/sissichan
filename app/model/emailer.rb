require 'yaml'

class Emailer < ActionMailer::Base
  sysvar = YAML::load(File.open("#{Rails.root}/config/sysvar.yml"))

  default :to => sysvar[ENV['CONFIG_ENV']]['email']

  def contact(contact_obj)
    @message = contact_obj.message
    @eventDate = contact_obj.event_date.strftime('%m/%d/%Y')
    @name = contact_obj.name
    @email = contact_obj.email
    @phone = contact_obj.phone

    mail(:subject => contact_obj.subject,
         :from => contact_obj.email,
         :reply_to => contact_obj.email)
  end
end
