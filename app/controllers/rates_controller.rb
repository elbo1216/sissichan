class RatesController < ApplicationController
  layout 'frame'

  def index
    @bride_rates = ProfessionalService.where(:service_type => 'bride', :is_live => true).order(:position)
    @other_rates = ProfessionalService.where(:service_type => 'other', :is_live => true).order(:position)
    @optional_rates_tier1 = ProfessionalService.where(:service_type => 'optional', :is_live => true).order(:position).limit(2)
    @optional_rates_tier2 = ProfessionalService.where('service_type = ? and is_live is true and position > 2', 'optional').order(:position)
  end

  def faq
    @faqs = Faq.where('deleted_at is null')    
  end

  def booking_policy
    @policy_content = File.read("#{Rails.root}/doc/policy_content.txt")
  end
end
