class ResponsePoro
  attr_reader :id, :location, :trails, :forecast
  def initialize(location, trails, forecast)
    @location = location
    @trails = trails
    @forecast = forecast
    @id = "null"
  end
end
