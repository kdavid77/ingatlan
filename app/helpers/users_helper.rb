module UsersHelper
  
  def signed_in?
    !current_user.nil?
  end
  
  def admin_user?
    (current_user.nil?)==false && current_user.admin
  end
  
end
