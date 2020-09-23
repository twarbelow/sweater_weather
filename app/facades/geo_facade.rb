class GeoFacade
  def self.get_coords(location)
    response = GeoService.geo_locate(location)
    GeoPoro.new(response)
  end
end
