class Emailer < ActionMailer::Base
  default :from => 'sissichan@gmail.com'

  def contact(name, email, subject, message, eventDate)
    mail(:subject => subject,
         :to => email,
         :from => 'sissichan@gmail.com')
   
    @message = message
    @eventDate = eventDate
    @name = name
    @email = email
  end
end
