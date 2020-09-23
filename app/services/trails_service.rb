class TrailsService
  def self.nearby_trails(lat, long)
    response = conn.get("data/get-trails?lat=#{lat}&lon=#{long}&maxDistance=10")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(
      url: 'https://www.hikingproject.com',
      params: {
        key: ENV['HIKING_DATA_API_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
