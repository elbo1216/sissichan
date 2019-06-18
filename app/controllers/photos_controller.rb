class PhotosController < ApplicationController
  layout "frame"

  def index
  end

  def glamor
    @gallery = Gallery.where(:gallery_type => 'glamor').order(:position) 
    render :gallery
  end

  def wedding
    @gallery = Gallery.where(:gallery_type => 'wedding').order(:position) 
    render :gallery
  end
end
