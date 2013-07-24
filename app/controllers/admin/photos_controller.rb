class Admin::PhotosController < AdminController

  def index
    redirect_to "/admin/photos/gallery"
  end

  def gallery
     @partial = 'gallery'
     @wedding = Gallery.find(:all, :include => :image, :conditions => ['gallery_type = ?', 'wedding'], :order => 'position')
     @glamor = Gallery.find(:all, :include => :image, :conditions => ['gallery_type = ?', 'glamor'], :order => 'position')
     @photo_images = PhotoImage.find_by_sql('select pi.* from images pi left join galleries g on g.image_id = pi.id where g.id is null')
    render :index
  end

  def edit_image
    image = PhotoImage.find(params['id'])
    image.caption = params['caption1']
    image.caption_url = params['caption1_url']
    image.caption2 = params['caption2']
    image.caption2_url = params['caption2_url']
    success = true
    begin
      image.save!
    rescue Exception => e
      logger.error(e.message)
      success = false
    end

    render :json => {'success' => success}
  end

  def delete_image
    PhotoImage.find(params['id']).destroy
    render :json => {'success' => true}
  end

  def upload_tmp
     path = "#{Rails.root.to_s}/tmp/uploads/#{params['files'].first.original_filename}"
     File.open(path, "w+") { |f| f.write(params['files'].first.read) }
     render :text => params['files'].first.original_filename
  end

  def remove_tmp
     path = "#{Rails.root.to_s}/tmp/uploads/#{params['filename']}"
     FileUtils.rm(path)
     render :text => true
  end

  def save_images
    ret = {:success => 0, :errors => {:count => 0, :messages =>[]}}
    json = JSON.parse(params['data'])
    json.each do |data|
      begin
        file = "#{Rails.root.to_s}/tmp/uploads/#{data['file']}"
        new_filename = "#{Time.now.strftime('%Y%m%d%H%M%S')}_#{data['file']}"
        FileUtils.mv file, File.join(PhotoImage.image_path_full, new_filename)
        image = PhotoImage.create!(:file_name => new_filename,
                                  :file_path => PhotoImage.image_path,
                                  :caption => data['caption1'],
                                  :caption_url => data['caption1_url'],
                                  :caption2 => data['caption2'],
                                  :caption2_url => data['caption2_url'])
        logger.info("Created Image")
        image.create_thumbnail
        ret[:success] += 1
      rescue Exception => e
        logger.error("FATAL: Error while saving #{data['file']}: #{e.message}")
        logger.error(e.backtrace.join("\n"))
        ret[:errors][:count] += 1
        ret[:errors][:messages] << e.message
      end
    end

    render :json => ret
  end

  def save_galleries
    message = 'Complete'
    wedding = Gallery.find(:all, :conditions => ['gallery_type = ?', 'wedding'], :order => 'position')
    glamor = Gallery.find(:all, :conditions => ['gallery_type = ?', 'glamor'], :order => 'position')
    new_wedding = params['wedding'] || []
    new_glamor = params['glamor'] || []

    begin
      wedding.each do |w|
        if new_wedding[w.image_id.to_s].blank?
          w.destroy
        else
          if w.position != new_wedding[w.image_id.to_s].to_i
            w.position = new_wedding[w.image_id.to_s].to_i
            w.save!
          end
          new_wedding.delete(w.image_id.to_s)
        end
      end

      new_wedding.each do |id, pos|
        gallery = Gallery.new
        gallery.image_id = id
        gallery.gallery_type = 'wedding'
        gallery.position = pos
        gallery.save!
      end

      glamor.each do |g|
        if new_glamor[g.image_id.to_s].blank?
          g.destroy
        else
          if g.position != new_glamor[g.image_id.to_s].to_i
            g.position = new_glamor[g.image_id.to_s].to_i
            g.save!
          end
          new_glamor.delete(g.image_id.to_s)
        end
      end

      new_glamor.each do |id, pos|
        gallery = Gallery.new
        gallery.image_id = id
        gallery.gallery_type = 'glamor'
        gallery.position = pos
        gallery.save!
      end
    rescue Exception => e
      message = 'Error when processing. Try again'
      logger.error e.message
    end

    render :text => message
  end

  def upload
    @partial = "upload"
    # Clear the upload folder in tmp
    FileUtils.rm_rf(Dir.glob("#{Rails.root.to_s}/tmp/uploads/*"))
    render :index
  end

  def get_image
    image = PhotoImage.find(params['image_id'])
    render :json => image.to_json
  end
end
