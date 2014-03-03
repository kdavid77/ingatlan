class UsersController < ApplicationController
  def new
    u=User.all
    if u.empty?
      newDefaultUser=User.new(name:"admin", email:"admin@example.com", password:"admin123", password_confirmation:"admin123", admin:true)
      newDefaultUser.save
    end
  end
end
