class PhotosController < ApplicationController
  layout "frame"

  def index
  end

  def glamor
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'glamor']) 
    render :gallery
  end

  def wedding
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'wedding']) 
    render :gallery
  end
end
