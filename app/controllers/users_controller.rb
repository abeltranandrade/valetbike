class UsersController < ApplicationController

  # display login form
  def login
    # @user = User.new
    #@username = cookies[:username]
  end

  # processs login form
  def create
    # do login process here
    @user = User.create(params.require(:user).permit(:username, :password, :name, :email))
    #cookies[:username] = params[:username]
    #redirect_to(form_path)
  end
  # @user.save
  # session[:user_id] = @user.id
  # redirect_to '/home'
end


#   skip_before_action :authorized, only: [:new, :create]

#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.create(params.require(:user).permit(:username, :password, :name, :email))
#     if @user.save
#       log_in @user
#       session[:user_id] = @user.id
#       redirect_to root_path
#     else
#       #need requirement
#       flash.now[:alert] << "Error: Please check the username password requirements"
#       end
#       render :action => 'new'
#     end
#   end
# end