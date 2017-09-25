class UsersController < ApplicationController

   #Sign Up New Users
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.id
      session[:user_id] = @user.id
      redirect_to estatesales_path
    else
      render 'new'
      flash[:danger] = 'There was a problem creating your account.'
    end
  end

  private
    def user_params
      params.require(:user).permit(:type, :username, :password, :email, :company_name, :owner_name, :company_url, :phone_number)
    end
end
