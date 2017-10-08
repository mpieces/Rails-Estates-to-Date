class AddFeaturedPhotoToEstatesales < ActiveRecord::Migration
  def change
    add_column :estatesales, :featured_photo, :string
  end
end
