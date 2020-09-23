class GeoService
  def self.geo_location(location)
    response = conn.get("geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.distance(point_a, point_b)
    response = conn.get("directions/v2/route?from=#{point_a}&to=#{point_b}")
    response = JSON.parse(response.body, symbolize_names: true)
    response[:route][:distance]
  end

  private

  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: {
        key: ENV['MAPQUEST_API_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
