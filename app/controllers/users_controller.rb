class UsersController < ApplicationController  
  def new
    u=User.all
    if u.empty?
      newDefaultUser=User.new(name:"admin", email:"admin@example.com", password:"admin123", password_confirmation:"admin123", admin:true, active:true)
      newDefaultUser.save
    end
    
    @user = User.new
  end
  
  def show
  end
  
  def edit
    if admin_user?
      @user = User.find_by_id(params[:id])
    elsif signed_in?
      @user = current_user
    else
      flash[:error]="Nem megengedett!"
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find_by_id(params[:id])
    if @user==current_user 
      if @user.authenticate(params[:user][:old_password])
        if params[:user][:password].empty?
        else
	  @user.password=params[:user][:password]
          @user.password_confirmation=params[:user][:password_confirmation] 
          if @user.save
            flash.now[:success]="Jelszó módosítva"
          else
	    flash.now[:warning]="Jelszó nincs módosítva!"
          end
        end
        if @user.name!=params[:user][:name]
          @user.name=params[:user][:name]
          if @user.save(validate:false)
            flash.now[:success]="Adat módosítva"
          else
	    flash.now[:warning]="Adat nincs módosítva!"
          end
	end
      else
	flash[:error]="Hibás jelszó, sikertelen adat módosítás!"
      end
      render 'edit'
    elsif admin_user?
      if @user.active!=params[:user][:active]
	@user.active=params[:user][:active]	
      end
      if @user.admin!=params[:user][:admin]
        @user.admin=params[:user][:admin]
      end
      @user.save(validate:false)
      flash.now[:success]="Adatok frissítve!"
      render 'edit'
    else
      flash[:error]="Unauthorized access!"
      redirect_to root_path
    end
  end
  
  def index
    if admin_user?
      @user_list=User.all
    else
      flash[:error]="Nem megengedett!"
      redirect_to root_path
    end
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
  
  def resend
    
  end
  
  def resent
    if params[:user][:email].empty?
      flash[:error]="Email cím és jelszó kötelező. Ha még nem regisztrált, most megteheti..."
      redirect_to signup_path
    else
      @user=User.find_by_email(params[:user][:email])
      if @user
	RegMailer.confirmation_request(@user).deliver
        flash[:success]="Jelszó újraküldve. Megerősítés után jelentkezzen be!"
	redirect_to signin_path
      else
	flash[:error]="E-mail cím nincs regisztrálva. Most megteheti! :)"
	redirect_to signup_path
      end
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :active, :admin)
    end
end
