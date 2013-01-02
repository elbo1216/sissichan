require 'ImageResize'
class PhotoImage < ActiveRecord::Base
  set_table_name 'images'
  has_many :gallery
  before_create :create_thumbnail

  def self.image_path_full
    "#{Rails.root.to_s}/public/images/photos/full"
  end

  def self.thumb_path_full
    "#{Rails.root.to_s}/public/images/photos/thumbs"
  end

  def self.image_path
    "/images/photos/full"
  end

  def self.thumb_path
    "/images/photos/thumbs"
  end

  def create_thumbnail
    big_full_path = File.join(PhotoImage.image_path_full, self.file_name)
    raise "No image found" unless File.exists?(big_full_path)
    self.thumb_file_name = "thumb_#{self.file_name}"
    self.thumb_file_path = PhotoImage.thumb_path
    Image.resize(big_full_path, File.join(self.thumb_path_full, self.thumb_file_name), 100, 100)
  end
end
