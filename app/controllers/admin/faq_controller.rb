class Admin::FaqController < AdminController
  def index
    @faqs = Faq.find(:all, :conditions => 'deleted_at is null')    
  end

  def deactivate
    faq = Faq.find_by_id(params['id'])
    faq.soft_delete!
    render :text => "deleted"
  end

  def upsert 
    faq = Faq.find(:first, :conditions => ['id = ?', params['id']]) || Faq.new
    faq.question = params['question']
    faq.answer = params['answer']
    faq.save

    render :json => {'id' => faq.id}
  end
end
