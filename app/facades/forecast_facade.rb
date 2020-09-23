class ForecastFacade
  def self.get_forecast(lat, long)
    info = WeatherService.one_call(lat, long)
    ForecastPoro.new(info)
  end
end
