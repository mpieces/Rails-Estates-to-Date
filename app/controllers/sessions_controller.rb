class SessionsController < ApplicationController

  def new
  end

  def create  #creates session for returning user
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      ######## change later:  #######
      redirect_to estatesales_path
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      render 'new'  #goes to sessions/new
    end
  end

  def destroy  #logs out user
    session[:user_id] = nil
    redirect_to estatesales_path
  end
end
