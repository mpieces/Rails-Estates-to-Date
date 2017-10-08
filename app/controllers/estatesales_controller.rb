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
    # respond_to do |format|
      if @sale.save
        # format.html { redirect_to @sale, notice: 'Sale was successfully published.'}
        # format.json { render :show, status: :created, sale: @sale}
      redirect_to @sale
      else
        render 'new'
      end
    # end
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

  def list
    render :advertise
  end

  private
    def estatesale_params
      params.require(:estatesale).permit(:featured_image, :title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment, :special_inst, {images: []})
    end

end
