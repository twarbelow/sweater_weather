class GeoPoro
  attr_reader :lat, :long

  def initialize(coord_hash)
    @lat = coord_hash[:lat]
    @long = coord_hash[:lng]
  end

end
