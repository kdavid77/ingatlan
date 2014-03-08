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
      user=User.find_by_remember_token(params[:rt])
      if user
	user.update_attribute(:active, true)
	redirect_to signin_path
      else
	redirect_to signup_path
	flash[:error]="Érvénytelen kód"
      end
    else
      redirect_to signup_path
    end
  end
  
end
