class ReviewsController < ApplicationController
  layout 'frame'

  def index
    @reviews = Review.where('is_live is true').order(:position)
  end
end
