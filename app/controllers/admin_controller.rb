class AdminController < ApplicationController
  layout "admin_layout", :except => [:login]
  before_action :authenticate_user!, :except => [:login, :afer_sign_out_path_for, :after_sign_in_path_for]
end
