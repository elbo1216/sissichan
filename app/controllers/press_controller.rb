class PressController < ApplicationController
  layout "frame"

  def index
    @press = PressRelease.where(:position => nil).order(:position)
  end
end
