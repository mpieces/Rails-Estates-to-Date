class FavoritesController < ApplicationController
  def index

  end

  def show  # change to current_user.favorites
    @favorite = Favorite.find(params[:id])
  end

  def create
      @user = current_user
      @favorites = @user.favorites.new(estatesale_params)

      if @favorites.save
        redirect_to @favorites
      else
        redirect_to estatesales_path
      end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to user_favorites_path
  end

   private
    def estatesale_params
      params.require(:estatesale).permit(:title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment, :special_inst, :img_url)
    end

end
