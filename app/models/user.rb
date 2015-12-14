class User < ActiveRecord::Base
  has_secure_password

  # Added:
  has_many :favorites
  has_many :favorite_sales, through: :favorites, source: :favorited, source_type: 'Estatesale'
end
