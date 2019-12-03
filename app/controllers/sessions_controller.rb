class SessionsController < Devise::SessionsController
  def create
     results = 'OK'
     resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
     sign_in(resource_name, resource)
     redirect_to '/admin/about'
   end

   def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    render "/users/sessions/new"
   end

   def destroy
     sign_out(current_user)
     redirect_to '/admin'
   end
end
