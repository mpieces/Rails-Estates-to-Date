class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|

      t.references :favorited, polymorphic: true, index: true
      # t. references :estatesale, index: true
      t.references :user, index: true
      t.references :shopper, index: true

      t.string :notes

      t.timestamps null: false
    end
  end
end
