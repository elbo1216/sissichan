class Faq < ActiveRecord::Base

  def soft_delete!
    self.deleted_at = Time.now
    self.save!
  end

end
