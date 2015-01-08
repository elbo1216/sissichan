class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_media
 
  def set_media
    @media =  Hash[SocialMedia.all.map {|sm| [sm.media_key, sm.url] }]
  end
end
