class UsersController < ApplicationController
  def initialize
    u=User.all
    if u.empty?
      newDefaultUser=User.new(name:"admin", email:"admin@example.com", password:"admin123", password_confirmation:"admin123", admin:true)
      newDefaultUser.save
    end
  end
  
  def new
  end
  
  def index
  end
end
