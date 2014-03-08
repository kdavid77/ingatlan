class StaticPagesController < ApplicationController
  def home
  end

  def signin
  end
  
  def about
  end
  
  def contact
  end
  
  def myacc
  end
  
  def confirm
    if (params.has_key?(:rt))
      user=User.find_by_remember_token(:rt)
      if user.nil?
	redirect_to signup_path
      else
	user.update_attribute(:active, true)
	redirect_to singin_path
      end
    else
      redirect_to signup_path
    end
  end
  
end
