require 'rubygems'
require 'RMagick'
include Magick

class PhotoImage < ActiveRecord::Base
  set_table_name 'images'
  has_many :galleries, :foreign_key => 'image_id'

  def before_destroy
    file = File.join(PhotoImage.image_path_full, file_name)
    File.delete(file) if File.exists?(file)

    thumb = File.join(PhotoImage.thumb_path_full, thumb_file_name)
    File.delete(thumb) if File.exists?(thumb)
  end

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
    logger.info("Creating Thumbnail for #{self.file_name}...")
    big_full_path = File.join(PhotoImage.image_path_full, self.file_name)
    raise "No image found" unless File.exists?(big_full_path)
    self.thumb_file_name = "thumb_#{self.file_name}"
    self.thumb_file_path = PhotoImage.thumb_path
    img = Image.read big_full_path
    thumb = img.first.scale(100, 100)
    thumb.write(File.join(PhotoImage.thumb_path_full, self.thumb_file_name))
    save!
  end
end
