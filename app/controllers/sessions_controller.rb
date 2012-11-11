class SessionsController < Devise::SessionsController
  def create
     results = 'OK'
     resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
     if resource.confirmed?
       a = sign_in(resource_name, resource)
     else
       results = 'UNCONFIRMED'
     end
     render :text => results
   end

   def new
     redirect_to '/admin' unless resource
   end

   def destroy
     sign_out(current_user)
     redirect_to '/admin'
   end
end
