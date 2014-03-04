class RegMailer < ActionMailer::Base
  default from: "david@larixstudio.ro"
  
  def confirmation_request(user)
    @user=user
    @url="ingatlan.herokuapp.com?confirm=" + @user.remember_token
    mail(to: @user.email, subject: "Ingatlan adatbázis regisztráció kérés")
  end
end
