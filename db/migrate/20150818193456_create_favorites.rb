class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :notes
      t.references :shopper, index: true
      t.references :estatesale, index: true

      t.timestamps null: false
    end
  end
end
