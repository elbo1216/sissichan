class Emailer < ActionMailer::Base
  def contact(recipient, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = recipient
    @from = 'sissichan@gmail.com'
    @sent_on = sent_at
    @body["message"] = message
   end
end
