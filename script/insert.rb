Dir.foreach("../public/images/photos/thumbs/") {|file|
  next if ['.', '..'].include?(file)

  thumb = Thumbnail.create!(:file_path => '/images/photos/thumbs', :file_name => file)
  file = file.gsub(/small/, "")
  full_file = "../public/images/photos/full/"
  full_file_name = file
  if full_file.include?("wedding") 
    full_file_name = "wedding_#{file}"
    full_file = full_file + full_file_name
  end

  Image.create!(:file_path => '/images/photos/full', :file_name  => full_file_name, :thumbnail_id => thumb.id)
}
