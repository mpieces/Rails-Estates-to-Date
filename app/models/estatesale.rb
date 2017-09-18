class Estatesale < ActiveRecord::Base
  validates :title, :city, :zip_code, :description, :start_date, :end_date, :times, presence: true
  validates :title, uniqueness: true
  geocoded_by :full_address
  after_validation :geocode


  belongs_to :lister
  #added (different from Sinatra set up):
  has_many :favorites
  has_many :shoppers, through: :favorites

  def distance_from(from)
    GoogleDistanceService.get_distance(from, full_address).round(2)
  end

  def full_address
    [address, city, state, zip_code].join(", ")
  end

end
