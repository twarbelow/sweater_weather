require 'rails_helper'

RSpec.describe "show action" do
  it "responds to a get request with properly formatted weather data for the correct location" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }
    get "/api/v1/forecast?location=#{location}", headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq("forecast")
    expect(json[:data][:attributes]).to include(:hourly)
    expect(json[:data][:attributes]).to include(:daily)
    expect(json[:data][:attributes]).to include(:current)
    expect(json[:data][:attributes][:current]).to include(:dt)
    expect(json[:data][:attributes][:current]).to include(:sunrise)
    expect(json[:data][:attributes][:current]).to include(:sunset)
    expect(json[:data][:attributes][:current]).to include(:temp)
    expect(json[:data][:attributes][:current]).to include(:feels_like)
    expect(json[:data][:attributes][:current]).to include(:humidity)
    expect(json[:data][:attributes][:current]).to include(:uvi)
    expect(json[:data][:attributes][:current]).to include(:weather)
    expect(json[:data][:attributes][:current][:weather][0]).to include(:main)
    expect(json[:data][:attributes][:current][:weather][0]).to include(:description)
    expect(json[:data][:attributes][:current][:weather][0]).to include(:icon)
    expect(json[:data][:attributes][:daily][0]).to include(:dt)
    expect(json[:data][:attributes][:daily][0]).to include(:sunrise)
    expect(json[:data][:attributes][:daily][0]).to include(:sunset)
    expect(json[:data][:attributes][:daily][0]).to include(:rain)
    expect(json[:data][:attributes][:daily][0]).to include(:humidity)
    expect(json[:data][:attributes][:daily][0]).to include(:weather)
    expect(json[:data][:attributes][:daily][0][:weather][0]).to include(:main)
    expect(json[:data][:attributes][:daily][0][:weather][0]).to include(:description)
    expect(json[:data][:attributes][:daily][0][:weather][0]).to include(:icon)
    expect(json[:data][:attributes][:hourly]).to include(:dt)
    expect(json[:data][:attributes][:hourly]).to include(:temp)
    expect(json[:data][:attributes][:hourly]).to include(:weather)
    expect(json[:data][:attributes][:hourly][:weather][0]).to include(:main)
    expect(json[:data][:attributes][:hourly][:weather][0]).to include(:description)
    expect(json[:data][:attributes][:hourly][:weather][0]).to include(:icon)


















  end
end
