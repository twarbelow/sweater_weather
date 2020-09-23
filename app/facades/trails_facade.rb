class TrailsFacade
  def self.get_trails(lat, long, location_name)
    response = TrailsService.nearby_trails(lat, long)
    trails = response[:trails].map do |trail|
      trail[:distance_to_trail] = GeoService.distance(trail[:location], location_name)
      TrailPoro.new(trail)
    end
  end
end
