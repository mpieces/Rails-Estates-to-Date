class Favorite < ActiveRecord::Base
  belongs_to :shopper
  belongs_to :estatesale
end
