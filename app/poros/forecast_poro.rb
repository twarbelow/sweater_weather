class ForecastPoro
  attr_reader :summary, :temperature

  def initialize(info)
    @summary = info[:weather][0][:description]
    @temperature = info[:temp]
  end
end
