class Emailer < ActionMailer::Base
  def contact(name, email, subject, message, eventDate)
    mail(:subject => subject,
         :recipients => email,
         :from => 'sissichan@gmail.com')
   
    @message = message
    @eventDate = eventDate
    @name = name
    @email = email
  end
end
