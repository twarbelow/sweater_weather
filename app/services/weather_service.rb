class WeatherService
  def self.one_call(lat, long)
    response = conn.get("onecall?lat={lat}&lon={lon}&exclude=alerts,minutely")
    JSON.parse(response.body, symbolize_keys: true)
  end

  private

  def self.conn
    Faraday.new(
      url: 'https://api.openweathermap.org/data/2.5',
      params: {
        appid: ENV['OPENWEATHER_API_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
