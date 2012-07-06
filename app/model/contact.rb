require 'net/http'

class Contact < ActiveRecord::Base
  def before_create
    key = unique_id if key.nil?
  end

  def self.unique_id
    Digest::SHA1.hexdigest Time.now.to_s
  end

  # NOTE: This is a crazy hack since I cannot get sendmail to work.
  # Sissi wanted to be able to change the From address in the email
  # fields but gmail does not allow you to do that.  The only other
  # option in Dreamhost was to use sendmail and that is what php uses.
  # I could not configure sendmail to work with rails so this hack
  # is in place so she can launch her site.  Should be removed when
  # an alternative is figured out.
  def send_mail_hack
    url = URI.parse('http://rails.sissichan.com/mail/sendmail.php')
    post_args = { 'name' => self.name,
                   'phone' => self.phone,
                   'email' => self.email,
                   'subject' => self.subject,
                   'key' => self.key,
                   'eventDate' => self.event_date,
                   'body' => self.message
                 }
    resp, data = Net::HTTP.post_form(url, post_args)
  end
end
