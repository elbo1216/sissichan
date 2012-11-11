class PressController < ApplicationController
  layout "frame"

  def index
    @press = PressRelease.find(:all, :conditions => ['position is not null'], :order => 'position')
  end
end
