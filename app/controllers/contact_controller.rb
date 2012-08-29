class ContactController < ApplicationController
  layout "frame"

  def index
    @is_away = File.exists?("#{Rails.root}/config/features/away");
  end

  def submit
    begin
      contact = Contact.new
      contact.name = params['name']
      contact.phone = params['phone']
      contact.email = params['email']
      contact.event_date = params['event_date']
      contact.subject = params['subject']
      contact.message = params['message']
      contact.save!
  
      Emailer.contact(contact).deliver
      contact.send_mail_hack
      
      render :text => 'Ok'
    rescue Exception => e
      render :text => e.message
    end
  end
end
