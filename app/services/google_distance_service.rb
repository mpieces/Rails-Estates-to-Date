class GoogleDistanceService

  # returns distance in miles
  def self.get_distance(from, to)
    url = full_url(from, to)
    #binding.pry
    response = HTTParty.get(url)
    meters = response["rows"].first["elements"].first["distance"]["value"]
    meters_to_miles(meters)
  end

  def self.meters_to_miles(meters)
    meters * 0.000621371
  end

  def self.full_url(from, to)
    params = ""
    params += "origins=#{from}"
    params += "&destinations=#{to}"
    params += "&key=#{ENV['GOOGLE_API_KEY']}"
    full_url = api_base_url + params
  end

  def self.api_base_url
    "https://maps.googleapis.com/maps/api/distancematrix/json?"
  end

end