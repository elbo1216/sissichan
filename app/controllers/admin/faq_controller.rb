class Admin::FaqController < AdminController
  def index
    @faqs = Faq.where('deleted_at is null')
  end

  def deactivate
    faq = Faq.find_by_id(params['id'])
    faq.soft_delete!
    render :text => "deleted"
  end

  def upsert 
    faq = Faq.('id = ?', params['id']) || Faq.new
    faq.question = params['question']
    faq.answer = params['answer']
    faq.save

    render :json => {'id' => faq.id}
  end
end
