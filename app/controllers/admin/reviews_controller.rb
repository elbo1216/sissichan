class Admin::ReviewsController < AdminController
  def index
    @partial = 'manage'
    @reviews = Review.find(:all, :conditions => ['is_live = 1'], :order => 'position')
  end

  def add_update_review
    val = 'Sucess'
    begin
      review = Review.new
      if params['id']
        review = Review.find(params['id'])
        position = review.position
      else 
        position = Review.find(:first, :order => 'position desc').position + 1
      end

      review.name = params['name']
      review.message = params['text']
      review.position = position
      review.save!
    rescue Exception => e
      logger.error e.message
      val = 'Error saving message.  Please try again'
    end
    render :text => val
  end

  def deactivate
    review = Review.find(params['id'])
    review.is_live = 0
    review.save

    render :text => 'Complete'
  end
end
