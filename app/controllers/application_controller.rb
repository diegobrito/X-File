class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged
  #check_authorization #requires authentication for all actions

  def logged
    @from_time = Time.now
  end
  
  #rescue_from CanCan::AccessDenied do |exception|
    #flash[:error] = exception.message
    #redirect_to root_url
  #end

end
