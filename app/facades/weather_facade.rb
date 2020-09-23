class WeatherFacade

  def self.get_weather(lat, long)
    info = WeatherService.one_call(lat, long)
    WeatherPoro.new(info)
  end
end
