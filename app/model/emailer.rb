class Emailer < ActionMailer::Base
  default :to => 'elbo1216@gmail.com'

  def contact(name, email, subject, message, eventDate)
    @message = message
    @eventDate = eventDate
    @name = name
    @email = email

    mail(:subject => subject,
         :from => email)
  end
end
