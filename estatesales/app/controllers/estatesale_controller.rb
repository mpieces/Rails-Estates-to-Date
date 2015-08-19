class EstatesaleController < ApplicationController
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

  end

  def destroy
  end

  private
    def estatesale_params
      params.require(:estatesale).permit(:title, :description)
    end

end
