class WeatherPoro
  attr_reader :current, :hourly, :daily, :id

  def initialize(info)
    @current = info[:current]
    @hourly = info[:hourly].first(8)
    @daily = info[:daily].first(5)

    current_keys = [:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :weather]
    hourly_keys = [:dt, :temp, :weather]
    daily_keys = [:dt, :sunrise, :sunset, :rain, :temp, :humidity, :weather]

    @current = keep_keys(@current, current_keys)
    @hourly = @hourly.map { |h| keep_keys(h, hourly_keys) }
    @daily = @daily.map { |d|
      temporary = keep_keys(d, daily_keys)
      temporary[:temp] = keep_keys(temporary[:temp], [:min, :max])
      temporary
    }
    @id = "null"
  end

  def keep_keys(source, keys)
    result = Hash[keys.map {|k| [k, nil]}]
    source.each do |k, v|
      result[k] = source[k] if keys.include?(k)
    end
    result
  end
end
