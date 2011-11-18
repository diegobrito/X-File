class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged

  def logged
    @from_time = Time.now
  end

end
