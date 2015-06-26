class RatesController < ApplicationController
  layout 'frame'

  def index
    @bride_rates = ProfessionalService.find(:all, :conditions => ['service_type = ? and is_live is true', 'bride'], :order => 'position')
    @other_rates = ProfessionalService.find(:all, :conditions => ['service_type = ? and is_live is true', 'other'], :order => 'position')
    @optional_rates_tier1 = ProfessionalService.find(:all, :conditions => ['service_type = ? and is_live is true', 'optional'], :order => 'position', :limit => 2)
    @optional_rates_tier2 = ProfessionalService.find(:all, :conditions => ['service_type = ? and is_live is true and position > 2', 'optional'], :order => 'position')
  end

  def faq
    @faqs = Faq.find(:all, :conditions => 'deleted_at is null')    
  end

  def booking_policy
    @policy_content = File.read("#{Rails.root}/doc/policy_content.txt")
  end
end
