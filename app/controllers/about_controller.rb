class AboutController < ApplicationController
  layout "frame"

  def index
    @about_content = File.read("#{Rails.root}/doc/about_content.txt")
  end

end
