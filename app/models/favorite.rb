class Favorite < ActiveRecord::Base
  # belongs_to :shopper
  # belongs_to :estatesale
  belongs_to :user
  belongs_to :favorited, polymorphic: true
end
