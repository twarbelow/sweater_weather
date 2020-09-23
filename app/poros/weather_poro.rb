class WeatherPoro
  attr_reader :current, :hourly, :daily, :current_keys, :hourly_keys, :daily_keys
  def initialize(info)
    @current = info[:current]
    @hourly = info[:hourly].first(8)
    @daily = info[:daily].first(5)
    @current_keys = [:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :weather]
    @hourly_keys = [:dt, :temp, :weather]
    @daily_keys = [:dt, :sunrise, :sunset, :rain, :temp, :humidity, :weather]
      # in temp for daily, only get :min and :max
  end
end
