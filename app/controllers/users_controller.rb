class UsersController < ApplicationController


  def new
  end

  def create
    @user = User.new()
  end


  private
    def user_params
      params.require(:user).permit(:type, :username, :password, :email, :company_name, :owner_name, :company_url, :phone_number)
    end
end
