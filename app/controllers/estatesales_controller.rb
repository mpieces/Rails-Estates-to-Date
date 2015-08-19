class EstatesalesController < ApplicationController
  def index
    @sales = Estatesale.all
  end

  def show
    @sale = Estatesale.find(params[:id])
  end

  def new
    @sale = Estatesale.new
  end

  def edit
    @sale = Estatesale.find(params[:id])
  end

  def create
    @sale = Estatesale.new(estatesale_params)

    if @sale.save
      redirect_to @sale
    else
      render 'new'
    end
  end

  def update
    @sale = Estatesale.find(params[:id])

    if @sale.update(estatesale_params)
      redirect_to @sale
    else
      render 'edit'
    end
  end

  def destroy
    @sale = Estatesale.find(params[:id])
    @sale.destroy

    redirect_to estatesales_path
  end

  private
    def estatesale_params
      params.require(:estatesale).permit(:title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment, :special_inst, :img_url)
    end

end
