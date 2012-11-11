caption_hash = {}

File.open('../doc/wedding_captions.csv').each do |line|
  arr = line.split(',')
  caption_hash[arr[0]] = {:caption => arr[1], :caption_url => arr[2].chomp}
end

File.open('../doc/glamor_captions.csv').each do |line|
  arr = line.split(',')
  caption_hash[arr[0]] = {:caption => arr[1], :caption_url => arr[2].chomp}
end

Dir.foreach("../public/images/photos/thumbs/") {|file|
  next if ['.', '..'].include?(file)

  full_file_name = file.gsub(/small/, "")
  
  puts "#{full_file_name}: #{caption_hash[full_file_name].inspect}"
  Image.create!(:thumb_file_path => '/images/photos/thumbs', :thumb_file_name => file, :file_path => '/images/photos/full', :file_name  => full_file_name, :caption => caption_hash[full_file_name][:caption], :caption_url => caption_hash[full_file_name][:caption_url])

}
