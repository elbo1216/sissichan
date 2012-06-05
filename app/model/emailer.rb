class Emailer < ActionMailer::Base
  default :to => 'elbo1216@gmail.com'

  def contact(name, email, subject, message, eventDate)
    mail(:subject => subject,
         :from => email)
   
    @message = message
    @eventDate = eventDate
    @name = name
    @email = email
  end
end
