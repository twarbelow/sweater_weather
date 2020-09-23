class GeoFacade
  def self.get_coords(location)
    response = GeoService.geo_location(location)
    coords = response[:results][0][:locations][0][:latLng]
    GeoPoro.new(coords)
  end
end
