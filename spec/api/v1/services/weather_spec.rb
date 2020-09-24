require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'returns weather service response when provided with lat and long' do
    VCR.use_cassette('weather_service', :match_requests_on => [:method, :path], :record => :new_episodes) do
      lat = "39.738453"
      long = "-104.984853"
      returned = WeatherService.one_call(lat, long)
      expect(returned).to be_a(Hash)
      expect(returned).to include(:current)
      expect(returned).to include(:hourly)
      expect(returned[:hourly]).to be_a(Array)
      expect(returned).to include(:daily)
      expect(returned[:daily]).to be_a(Array)
    end
  end
end
