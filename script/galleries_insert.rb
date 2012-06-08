hash = {}
Image.find(:all, :conditions => "file_name like '%wedding%'").each do |i| 
  hash[i.file_name.split('_')[1].gsub(/\.jpg/,"").to_i] = i 
end

arr = hash.sort_by {|k,v| k}

arr.each do |a| 
  Gallery.create!(:image_id => a[1].id, :gallery_type => 'wedding')
end

hash = {}
Image.find(:all, :conditions => "file_name not like '%wedding%'").each do |i| 
  hash[i.file_name.split('.')[0].gsub(/G/,"").to_i] = i 
end

arr = hash.sort_by {|k,v| k}

arr.each do |a| 
  Gallery.create!(:image_id => a[1].id, :gallery_type => 'glamor')
end

