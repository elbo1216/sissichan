class Admin::ProfessionalServicesController < AdminController
  def index
    @partial = 'manage'
    @bride_rates = ProfessionalService.where('service_type = ? and is_live is true', 'bride').order(:position)
    @other_rates = ProfessionalService.where('service_type = ? and is_live is true', 'other').order(:position)
    @optional_rates_tier1 = ProfessionalService.where('service_type = ? and is_live is true', 'optional').order(:position).limit(2)
    @optional_rates_tier2 = ProfessionalService.where('service_type = ? and is_live is true and position > 2', 'optional').order(:position)
    @all_services = @bride_rates | @other_rates | @optional_rates_tier1 | @optional_rates_tier2
  end

  def update_records
    ps = ProfessionalService.find(params['id'])
    ps.service_name = params['service_name']
    ps.service_rate = params['service_rate']
    
    render :json => {'success' => ps.save}
  end
end
