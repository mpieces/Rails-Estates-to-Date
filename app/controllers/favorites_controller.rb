class FavoritesController < ApplicationController

  # def index
  #   if logged_in?
  #     @favorites = current_user.favorites.all
  #   end
  # end

  def show
    if logged_in?
      @favorites = current_user.favorites
      redirect_to user_favorite_path
    end
  end

  def create
      @favorites = current_user.favorites.new(estatesale_params)

      if @favorites.save
        redirect_to @favorites
      else
        redirect_to user_favorite_path(current_user)
      end
  end

  # def destroy
  #   @favorite = Favorite.find(params[:id])
  #   @favorite.destroy

  #   redirect_to user_favorites_path
  # end

   private
    def estatesale_params
      params.require(:estatesale).permit(:title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment, :special_inst, :img_url)
    end

end
