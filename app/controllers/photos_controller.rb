class PhotosController < ApplicationController
  layout "frame"

  def index
  end

  def glamor
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'glamor'], :order => 'id') 
    render :gallery
  end

  def wedding
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'wedding'], :order => 'id') 
    render :gallery
  end
end
