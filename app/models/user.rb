class User < ActiveRecord::Base

  validates_presence_of :username, :password, :email
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Please enter a valid email address."
  validates_length_of :username, :minimum => 3, :message => "Username must be at least 3 characters."
  validates_length_of :password, :in => 6..20, :message => "must be between 6-20 characters."
  has_secure_password

  # Added:
  has_many :favorites
  has_many :favorite_sales, through: :favorites, source: :favorited, source_type: 'Estatesale'


end


