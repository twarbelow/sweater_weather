require 'rails_helper'
require 'vcr'

RSpec.describe WeatherFacade do
  it "get_weather returns a WeatherPoro" do
    VCR.use_cassette('weather_denver', :match_requests_on => [:method, :path], :record => :new_episodes) do
      lat = "39.738453"
      long = "-104.984853"

      returned = WeatherFacade.get_weather(lat, long)

      expect(returned).to be_a(WeatherPoro)
    end
  end
end
