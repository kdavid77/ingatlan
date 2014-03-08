class RegMailer < ActionMailer::Base
  default from: "david@larixstudio.ro"
  
  def confirmation_request(user)
    @user=user
    @url="ingatlan.herokuapp.com/confirm?rt=" + @user.remember_token
    mail(to: @user.email, subject: "Ingatlan adatbázis regisztráció")
  end
  
  def confirmation_resend(user)
    @user=user
    @url="ingatlan.herokuapp.com/confirm?rt=" + @user.remember_token
    mail(to: @user.email, subject: "Megerősítés újra")
  end
end
