class Estatesale < ActiveRecord::Base
  belongs_to :lister
  #added:
  has_many :favorites
  has_many :shoppers, through: :favorites
end
