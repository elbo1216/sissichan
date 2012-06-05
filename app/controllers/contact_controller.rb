class ContactController < ApplicationController
  layout "frame"

  def index
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
  
      contacter = Emailer.contact(contact.name, contact.email, contact.subject, contact.message, contact.event_date)
      contacter.deliver
  
      render :text => "Ok"
    rescue Exception => e
      render :text => e.message
    end
  end
end
