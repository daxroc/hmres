class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
    
  private 

  # Ensure logged in user is an admin
  # Used to restrict some operations 
  # to users privileged with admin = true
  def ensure_admin!
    # D: Send admin status to log
    logger.debug "current_user.admin? => #{current_user.admin?}"
    unless current_user.admin?
      flash[:notice] = 'You do not have sufficient privileges.'
      redirect_to root_path
      return false
    end  
  end
  
end
