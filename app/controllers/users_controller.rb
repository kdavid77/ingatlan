class UsersController < ApplicationController  
  def new
    u=User.all
    if u.empty?
      newDefaultUser=User.new(name:"admin", email:"admin@example.com", password:"admin123", password_confirmation:"admin123", admin:true, active:true)
      newDefaultUser.save
    end
    
    @user = User.new
  end
  
  def index
    @user_list=User.all
  end
  
  def create
    @user=User.new(user_params)
    @regSuccessMessage="Sikeresen regisztráltuk az Ön kérését. A megerősítéshez szükséges linket a megadott címre kiküldtük"
    
    if @user.save
      flash[:success]= @regSuccessMessage
      RegMailer.confirmation_request(@user).deliver
      redirect_to signin_path
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
