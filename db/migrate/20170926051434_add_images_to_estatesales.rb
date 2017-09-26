class AddImagesToEstatesales < ActiveRecord::Migration
  def change
    add_column :estatesales, :images, :string
  end
end
