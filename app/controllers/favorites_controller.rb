class FavoritesController < ApplicationController

  def index
      @favorites = current_user.favorites
  end

  def show

  end

  def create
      @sale = Estatesale.find(params[:id])
      @favorites = current_user.favorites.new(estatesale_params)

      respond_to do |format|
        if @favorites.save
          format.html { redirect_to user_favorite_path(current_user)}
          format.js
          format.json { render action: 'show', status: :created, location: @favorites}
        else
          format.html { render action: 'new' }
          format.json { render json: @favorites.errors,
          status: :unprocessable_entity}
        end
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
