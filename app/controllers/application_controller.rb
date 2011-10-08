class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def checking
    unless User.find_by_Unity_ID(session[:Unity_ID])
    redirect_to(:controller => "logins", :action=>"new")
  end
  end
end

