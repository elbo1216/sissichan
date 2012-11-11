class PhotosController < ApplicationController
  layout "frame"

  def index
  end

  def glamor
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'glamor'], :order => 'position') 
    render :gallery
  end

  def wedding
    @gallery = Gallery.find(:all, :conditions => ['gallery_type = ?', 'wedding'], :order => 'position') 
    render :gallery
  end
end
