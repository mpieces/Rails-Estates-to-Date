class Estatesale < ActiveRecord::Base
  validates_presence_of :title, :address, :city, :state, :zip_code, :start_date, :end_date, :times, :description, :forms_of_payment
  validates :title, uniqueness: true
  geocoded_by :full_address
  after_validation :geocode

# For Carrierwave photos:
  attr_accessor :photos
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON


  belongs_to :lister
  has_many :favorites
  has_many :shoppers, through: :favorites

# To determine distance from zip code input:
  def distance_from(from)
    GoogleDistanceService.get_distance(from, full_address).round(2)
  end

  def full_address
    [address, city, state, zip_code].join(", ")
  end

end
