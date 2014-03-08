class SessionsController < ApplicationController
  def new
  end
  
  def create
    user=User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.active 
        flash[:success]="Üdv, " + user.name
        sign_in user
        redirect_to root_path
      else
	flash[:error]="Kérjük, ellenőrizze a postafiókját és a küldött link segítségével erősítse meg a regisztrációját!"
	redirect_to signin_path
      end
    else
      flash.now[:error]="Nem sikerult"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
