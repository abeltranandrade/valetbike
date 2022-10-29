class LoginController < ApplicationController
    
    def login
    end

   def create
     @user = User.find_by(username: params[:session][:username])

     if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_path
     else
       flash[:alert] = 'Error: Wrong Username or Password'
       redirect_to '/home'
     end
   end
   
   def destroy
    do logout process here
    session.delete(:user_id)
    @_current_user = nil

    redirect_to(home_path)
    end
end

 
