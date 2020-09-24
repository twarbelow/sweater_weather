require 'rails_helper'
require 'yaml'

RSpec.describe WeatherPoro do
  it "is initialized with id, location, weather_url, source, author, and logo can be read" do
    info = YAML.load(File.read(Rails.root.join('spec/fixtures/vcr_cassettes/weather_service.yml')))
    parsed = JSON.parse(info["http_interactions"][0]["response"]["body"]["string"], symbolize_names: true)
    weather = WeatherPoro.new(parsed)

    expect(weather.id).to eq("null")
    expect(weather.current).to be_a(Hash)

    expect(weather.current[:dt]).to be_a(Integer)
    expect(weather.current[:sunrise]).to be_a(Integer)
    expect(weather.current[:sunset]).to be_a(Integer)
    expect(weather.current[:temp]).to be_a(Float)
    expect(weather.current[:feels_like]).to be_a(Float)
    expect(weather.current[:humidity]).to be_a(Integer)
    expect(weather.current[:uvi]).to be_a(Float)
    expect(weather.current[:weather]).to be_a(Array)

    expect(weather.current[:weather][0][:id]).to be_a(Integer)
    expect(weather.current[:weather][0][:main]).to be_a(String)
    expect(weather.current[:weather][0][:description]).to be_a(String)
    expect(weather.current[:weather][0][:icon]).to be_a(String)

    expect(weather.daily[0][:dt]).to be_a(Integer)
    expect(weather.daily[0][:sunrise]).to be_a(Integer)
    expect(weather.daily[0][:sunset]).to be_a(Integer)
    expect(weather.daily[0][:temp]).to be_a(Hash)
    expect(weather.daily[0][:humidity]).to be_a(Integer)
    expect(weather.daily[0][:weather]).to be_a(Array)

    expect(weather.daily[0][:weather][0][:id]).to be_a(Integer)
    expect(weather.daily[0][:weather][0][:main]).to be_a(String)
    expect(weather.daily[0][:weather][0][:description]).to be_a(String)
    expect(weather.daily[0][:weather][0][:icon]).to be_a(String)

    expect(weather.hourly[0][:dt]).to be_a(Integer)
    expect(weather.hourly[0][:temp]).to be_a(Float)
    expect(weather.hourly[0][:weather]).to be_a(Array)

    expect(weather.hourly[0][:weather][0][:id]).to be_a(Integer)
    expect(weather.hourly[0][:weather][0][:main]).to be_a(String)
    expect(weather.hourly[0][:weather][0][:description]).to be_a(String)
    expect(weather.hourly[0][:weather][0][:icon]).to be_a(String)
  end
end
