class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorite = current_user.favorites
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
    @favorite = current_user.favorites
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @user = current_user
    @favorite = @user.favorites.create(estatesale_id: params[:estatesale_id])
    # @favorites = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def estatesale_params
      params.require(:estatesale).permit(:title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment, :special_inst, :img_url)
    end
    # Use callbacks to share common setup or constraints between actions.
    # def set_favorite
    #   @favorite = Favorite.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def favorite_params
    #   params[:favorite]
    # end

end
