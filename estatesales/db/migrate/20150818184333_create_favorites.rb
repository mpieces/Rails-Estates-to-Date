class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :notes
      t.references :user, index: true, foreign_key: true
      t.references :estatesale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
