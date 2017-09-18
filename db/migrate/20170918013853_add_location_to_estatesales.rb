class AddLocationToEstatesales < ActiveRecord::Migration
  def change
    add_column :estatesales, :latitude, :float
    add_column :estatesales, :longitude, :float
  end
end
