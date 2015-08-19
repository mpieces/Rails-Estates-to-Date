class CreateEstatesales < ActiveRecord::Migration
  def change
    create_table :estatesales do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :start_date
      t.string :end_date
      t.string :times
      t.string :description
      t.string :forms_of_payment
      t.string :special_inst
      t.string :img_url
      t.references :lister, index: true

      t.timestamps null: false
    end
  end
end
