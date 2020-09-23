class ForecastPoro
  attr_reader :summary, :temperature

  def initialize(info)
    @summary = info[:current][:weather][0][:description]
    @temperature = info[:current][:temp].to_s
  end
end
