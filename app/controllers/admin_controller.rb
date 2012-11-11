class AdminController < ApplicationController
  before_filter :authenticate_user!, :except => [:login, :afer_sign_out_path_for, :after_sign_in_path_for]
  layout "admin", :except => [:login]
  
  def after_sign_out_path_for(resource)                                                  
    '/admin'
  end                                                                                    
                                                                                         
  def after_sign_in_path_for(resource)                                                   
    '/admin/about'                                                                              
  end    

  def login
    if request.post?
      resp = "MISSING EMAIL" if params[:email].blank?
      resp = "MISSING PASSWORD" if params[:pass].blank?
      user = User.find(:first, :conditions => ['email = ?', params[:email]])
      resp = "USER NOT FOUND" unless user
      sign_in user
      redirect_to '/admin/about/'
      return
    end

    render '/admin/login/index'
  end

end
