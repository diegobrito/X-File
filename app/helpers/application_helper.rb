module ApplicationHelper
  def is_admin?
    current_user.role == "Admin"
  end
  
  def logged_in?
    current_user
  end
  
  def logged_out?
  end
    
  def loggedmin?
    if logged_in?
      current_user
      if is_admin?
        current_user.role == "Admin"
      end
    end
  end
end
