class ImagesController < ApplicationController
  before_action :set_estate_sale

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @sale.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed to delete image." unless @sale.save
    redirect_to :back
  end

  private

  def set_estate_sale
    @sale = Estatesale.find(params[:id])
  end

  def add_more_images(new_images)
    images = @sale.images
    images += new_images
    @sale.images = images
  end

  def remove_image_at_index(index)
    remaining_images = @sale.images # copy the array
    deleted_image = remaining_images.delete_at(index) # delete the target image
    # deleted_image.try(:remove!) # delete image from S3
    @sale.images = remaining_images # re-assign back
  end

  def images_params
    params.require(:estatesale).permit({images: []})
  end
end
