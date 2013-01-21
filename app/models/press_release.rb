class PressRelease < ActiveRecord::Base
  def self.clear_all_positions
    PressRelease.find(:all, :conditions => ['position is not null']).each do |pr|
      pr.position = nil
      pr.save!
    end
  end

  def upload_file(upload)
    ext = upload.original_filename.split('.').last
    filename = "#{Time.now.strftime('%Y%m%d%H%m%s')}_press_img.#{ext}"
    path = File.join(Rails.root, 'public', 'images', 'press', filename)
    self.image_file_path = '/images/press'
    self.image_file_name = filename
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
end
