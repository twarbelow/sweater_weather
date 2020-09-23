class WeatherPoro
  attr_reader :current, :hourly, :daily
  def initialize(info)
    @current = info[:current]
    @hourly = info[:hourly].first(8)
    @daily = info[:daily].first(5)
  end

end
