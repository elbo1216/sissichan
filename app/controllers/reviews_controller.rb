class ReviewsController < ApplicationController
  layout 'frame'

  def index
    @reviews = Review.find(:all, :conditions => ['is_live is true'])
  end
end
