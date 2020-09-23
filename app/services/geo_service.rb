class GeoService
  def self.geo_location(location)
    response = conn.get("geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
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
