class Estatesale < ActiveRecord::Base
  validates :title, :city, :zip_code, :description, :start_date, :end_date, :times, presence: true
  validates :title, uniqueness: true


  belongs_to :lister
  #added (different from Sinatra set up):
  has_many :favorites
  has_many :shoppers, through: :favorites
end
