class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :company_name
      t.string :owner_name
      t.string :company_url
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
