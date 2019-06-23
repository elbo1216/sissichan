class PressController < ApplicationController
  layout "frame"

  def index
    @press = PressRelease.where("position is not null").order(:position)
  end
end
