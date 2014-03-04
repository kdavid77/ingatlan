class StaticPagesController < ApplicationController
  def home
  end

  def signin
  end
  
  def about
  end
  
  def contact
  end
  
  def confirm
    if (params.has_key?(:rt))
      user=User.find_by_remember_token(:rt)
      if user.nil?
	redirect_to signup_path
      else
	user.update_attribute(:active, true)
	user.update_attribute(:remember_token, nil)
      end
    else
      redirect_to signup_path
    end
  end
  
end
